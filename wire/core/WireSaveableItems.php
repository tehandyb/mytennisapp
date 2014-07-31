<?php

/**
 * ProcessWire WireSaveableItems
 *
 * Wire Data Access Object, provides reusable capability for loading, saving, creating, deleting, 
 * and finding items of descending class-defined types. 
 * 
 * ProcessWire 2.x 
 * Copyright (C) 2013 by Ryan Cramer 
 * Licensed under GNU/GPL v2, see LICENSE.TXT
 * 
 * http://processwire.com
 *
 */

abstract class WireSaveableItems extends Wire implements IteratorAggregate {

	/**
	 * Return the WireArray that this DAO stores it's items in
	 *
	 */
	abstract public function getAll();

	/**
	 * Return a new blank item 
	 *
	 */
	abstract public function makeBlankItem();

	/**
	 * Return the name of the table that this DAO stores item records in
	 *
	 */
	abstract public function getTable();


	/**
	 * Return the default name of the field that load() should sort by (default is none)
	 *
	 * This is overridden by selectors if applied during the load method
	 *
	 */
	public function getSort() { return ''; }

	/**
	 * Provides additions to the ___load query for when selectors or selector string are provided
	 *
	 */
	protected function getLoadQuerySelectors($selectors, DatabaseQuerySelect $query) {

		$database = $this->wire('database'); 

		if(is_object($selectors) && $selectors instanceof Selectors) {
			// iterable selectors
		} else if($selectors && is_string($selectors)) {
			// selector string, convert to iterable selectors
			$selectors = new Selectors($selectors); 

		} else {
			// nothing provided, load all assumed
			return $query; 
		}

		$functionFields = array(
			'sort' => '', 
			'limit' => '', 
			'start' => '',
			); 

		foreach($selectors as $selector) {

			if(!$database->isOperator($selector->operator)) 
				throw new WireException("Operator '{$selector->operator}' may not be used in {$this->className}::load()"); 

			if(in_array($selector->field, $functionFields)) {
				$functionFields[$selector->field] = $selector->value; 
				continue; 
			}

			if(!in_array($selector->field, $fields)) 
				throw new WireException("Field '{$selector->field}' is not valid for {$this->className}::load()"); 

			$selectorField = $database->escapeTableCol($selector->field); 
			$value = $database->escapeStr($selector->value); 
			$query->where("{$selectorField}{$selector->operator}'$value'"); // QA
		}

		if($functionFields['sort'] && in_array($functionFields['sort'], $fields)) $query->orderby("$functionFields[sort]");
		if($functionFields['limit']) $query->limit(($functionFields['start'] ? ((int) $functionFields['start']) . "," : '') . $functionFields['limit']); 

		return $query; 

	}

	/**
	 * Get the DatabaseQuerySelect to perform the load operation of items
	 *
	 * @param Selectors|string|null $selectors Selectors or a selector string to find, or NULL to load all. 
	 * @return DatabaseQuerySelect
	 *
	 */
	protected function getLoadQuery($selectors = null) {

		$item = $this->makeBlankItem();
		$fields = array_keys($item->getTableData());
		$database = $this->wire('database'); 
		
		$table = $database->escapeTable($this->getTable());
		
		foreach($fields as $k => $v) {
			$v = $database->escapeCol($v);
			$fields[$k] = "$table.$v"; 
		}

		$query = new DatabaseQuerySelect();
		$query->select($fields)->from($table);
		if($sort = $this->getSort()) $query->orderby($sort); 
		$this->getLoadQuerySelectors($selectors, $query); 

		return $query; 

	}

	/**
	 * Load items from the database table and return them in the same type class that getAll() returns
	 
	 * A selector string or Selectors may be provided so that this can be used as a find() by descending classes that don't load all items at once.  
	 *
	 * @param WireArray $items
	 * @param Selectors|string|null $selectors Selectors or a selector string to find, or NULL to load all. 
	 * @return WireArray Returns the same type as specified in the getAll() method.
	 *
	 */
	protected function ___load(WireArray $items, $selectors = null) {

		$database = $this->wire('database');
		$sql = $this->getLoadQuery($selectors)->getQuery();
		
		$query = $database->prepare($sql);	
		$query->execute();
		
		while($row = $query->fetch(PDO::FETCH_ASSOC)) {
			$item = $this->makeBlankItem();
			foreach($row as $field => $value) {
				if($field == 'data') {
					if($value) $value = $this->decodeData($value);
					else continue;
				}
				$item->$field = $value;
			}
			$item->setTrackChanges(true);
			$items->add($item);
		}
		$query->closeCursor();
			
		$items->setTrackChanges(true); 
		return $items; 
	}

	/**
	 * Should the given item key/field be saved in the database?
	 *
	 * Template method used by ___save()
	 *
	 */
	protected function saveItemKey($key) {
		if($key == 'id') return false;
		return true; 
	}

	/**
	 * Save the provided item to database
	 *
	 * @param Saveable $item The item to save
	 * @return bool Returns true on success, false on failure
	 * @throws WireException
	 *
	 */
	public function ___save(Saveable $item) {

		$blank = $this->makeBlankItem();
		if(!$item instanceof $blank) throw new WireException("WireSaveableItems::save(item) requires item to be of type '" . $blank->className() . "'"); 

		$database = $this->wire('database'); 
		$table = $database->escapeTable($this->getTable());
		$sql = "`$table` SET ";
		$id = (int) $item->id;
		$this->saveReady($item); 
		$data = $item->getTableData();

		foreach($data as $key => $value) {
			if(!$this->saveItemKey($key)) continue; 
			if($key == 'data') {
				if(is_array($value)) {
					$value = $this->encodeData($value); 
				} else $value = '';
			}
			$key = $database->escapeTableCol($key);
			$value = $database->escapeStr("$value"); 
			$sql .= "`$key`='$value', ";
		}

		$sql = rtrim($sql, ", "); 

		if($id) {
			
			$query = $database->prepare("UPDATE $sql WHERE id=:id");
			$query->bindValue(":id", $id, PDO::PARAM_INT);
			$result = $query->execute();
			
		} else {
			
			$query = $database->prepare("INSERT INTO $sql"); 
			$result = $query->execute();
			if($result) {
				$item->id = $database->lastInsertId();
				$this->getAll()->add($item);
				$this->added($item);
			}
		}

		if($result) {
			$this->saved($item);
			$this->resetTrackChanges();
		}
		return $result;
	}


	/** 
	 * Delete the provided item from the database
	 *
	 * @param Saveable $item Item to save
	 * @return bool Returns true on success, false on failure
	 * @throws WireException
	 *
	 */
	public function ___delete(Saveable $item) {
		$blank = $this->makeBlankItem();
		if(!$item instanceof $blank) throw new WireException("WireSaveableItems::delete(item) requires item to be of type '" . $blank->className() . "'"); 
		
		$id = (int) $item->id;
		if(!$id) return false; 
		
		$database = $this->wire('database'); 
		
		$this->deleteReady($item);
		$this->getAll()->remove($item); 
		$table = $database->escapeTable($this->getTable());
		
		$query = $database->prepare("DELETE FROM `$table` WHERE id=:id LIMIT 1"); 
		$query->bindValue(":id", $id, PDO::PARAM_INT); 
		$result = $query->execute();
		
		if($result) {
			$this->deleted($item);
			$item->id = 0; 
		}
		
		return $result;	
	}

	/**
	 * Create and return a cloned copy of this item
	 *
	 * If the new item uses a 'name' field, it will contain a number at the end to make it unique
	 *
	 * @param Saveable $item Item to clone
	 * @return bool|Saveable $item Returns the new clone on success, or false on failure
	 *
	 */
	public function ___clone(Saveable $item) {

		$item = clone $item;

		if(array_key_exists('name', $item->getTableData())) {
			// this item uses a 'name' field for identification, so we want to ensure it's unique
			$n = 0;
			$name = $item->name; 
			// ensure the new name is unique
			while($this->get($name)) $name = $item->name . '_' . (++$n); 
			$item->name = $name; 
		}

		// id=0 forces the save() to create a new field
		$item->id = 0;
		if($this->save($item)) return $item; 
		return false; 
	}

	/**
	 * Find items based on Selectors or selector string
	 *
	 * This is a delegation to the WireArray associated with this DAO.
	 * This method assumes that all items are loaded. Desecending classes that don't load all items should 
	 * override this to the ___load() method instead. 
	 *
	 * @param Selectors|string $selectors 
	 * @return WireArray 
	 *
	 */
	public function ___find($selectors) {
		return $this->getAll()->find($selectors); 
	}

	public function getIterator() {
		return $this->getAll();
	}

	public function get($key) {
		return $this->getAll()->get($key); 
	}

	public function __get($key) {
		$value = $this->get($key);
		if(is_null($value)) $value = parent::__get($key);
		return $value; 
	}

	public function has($item) {
		return $this->getAll()->has($item); 
	}

	public function __isset($key) {
		return $this->get($key) !== null;	
	}

	/**
	 * Encode the 'data' portion of the table.
	 * 	
	 * This is a front-end to wireEncodeJSON so that it can be overridden if needed.
	 *
	 */
	protected function encodeData(array $value) {
		return wireEncodeJSON($value); 
	}

	/**
	 * Decode the 'data' portion of the table.
	 * 	
	 * This is a front-end to wireDecodeJSON that it can be overridden if needed.
	 *
	 */
	protected function decodeData($value) {
		return wireDecodeJSON($value);
	}

	/**
	 * Enforce no locally-scoped fuel for this class
	 *
	 */
	public function useFuel($useFuel = null) {
		return false;
	}

	/**
	 * Hook that runs right before item is to be saved.
	 * 
	 * Unlike before(save), when this runs, it has already been confirmed that the item will indeed be saved.
	 * 
	 * @param Saveable $item
	 * 
	 */
	public function ___saveReady(Saveable $item) { }
	
	/**
	 * Hook that runs right before item is to be deleted.
	 *
	 * Unlike before(delete), when this runs, it has already been confirmed that the item will indeed be deleted.
	 *
	 * @param Saveable $item
	 *
	 */
	public function ___deleteReady(Saveable $item) { }
	
	/**
	 * Hook that runs right after an item has been saved. 
	 *
	 * Unlike after(save), when this runs, it has already been confirmed that the item has been saved (no need to error check).
	 *
	 * @param Saveable $item
	 *
	 */
	public function ___saved(Saveable $item) { }
	
	/**
	 * Hook that runs right after a new item has been added. 
	 *
	 * @param Saveable $item
	 *
	 */
	public function ___added(Saveable $item) { }
	
	/**
	 * Hook that runs right after an item has been deleted. 
	 * 
	 * Unlike after(delete), it has already been confirmed that the item was indeed deleted.
	 *
	 * @param Saveable $item
	 *
	 */
	public function ___deleted(Saveable $item) { }
	
}
