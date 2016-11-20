//
//  Person.swift
//  Learning-SQLite
//
//  Created by Michael Malotte on 11/19/16.
//  Copyright © 2016 Michael Malotte. All rights reserved.
//

import Foundation
import SQLite

class Person {
  
  private static let db = DB.instance

  private static let _person = Table("person")
  private static let _post = Table("post")
  
  private static let _person_id = Column.person_id
  private static let _name = Column.name
  private static let _text = Column.text
  
  private static var _collection: Array<Row> = []
  
  static var collection: Array<Row> {
    get {
      return _collection
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
  
  static func load(){
    
    do {
      
      _collection = Array(try db.prepare(_person))
      
    } catch let error {
      
      print("Error: \(error)")
      
    }
    
  }
  
}
