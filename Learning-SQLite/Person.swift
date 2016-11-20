//
//  Person.swift
//  Learning-SQLite
//
//  Created by Michael Malotte on 11/19/16.
//  Copyright © 2016 Michael Malotte. All rights reserved.
//

import Foundation
import SQLite

class Person: TableHandler {
  
  private static let db = DB.instance

  private static let _person = T.Person
  private static let _post = T.Post
  
  private static let _personID = C.person_id
  private static let _name = C.name
  private static let _text = C.text
  
  private static var _collection: Array<Row> = []
  
  static var collection: Array<Row> {
    get {
      return _collection
    }
  }
  
  static func create(){
    
    do {
      
      try db.run(_person.create { t in
        t.column(_personID, primaryKey: .autoincrement)
        t.column(_name)
      })
      
    } catch {
      
    }
    
  }
  
  static func loadCollection(){
    
    do {
      
      _collection = Array(try db.prepare(_person))
      
    } catch let error {
      
      print("Error: \(error)")
      
    }
    
  }
  
  static func insert(name: String) -> Int64? {
    do {
      
      return try db.run(_person.insert(_name <- name))
      
    } catch let error {
      
      print("Error: \(error)")
      
      return nil
    }
  }
  
  static func delete(row: Row){
    
    let person = _person.filter(row[_personID] == _personID)
    
    do {
      
      _ = try db.run(person.delete())
      
    } catch let error {
      
      print(error)
      
    }
    
  }
  
}
