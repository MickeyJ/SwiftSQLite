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
  
  private static let db = DB.instance!

  private static let person = Table("person")
  
  private static let id = Column.id
  private static let name = Column.name
  
  static var collection: Array<Row> = []
  
  static func insert(value: String) {
    do {
      _ = try db.run(person.insert(name <- value))
    } catch let error {
      print("Error: \(error)")
    }
  }
  
  static func selectAll(){
    
    do {
      let selection = try db.prepare(person)
      
      print("")
      print("     People")
      print("————————————————")
      for row in selection {
        print("id: \(row[id]), name: \(row[name])")
        collection.append(row)
      }
      
    } catch let error {
      print("Error: \(error)")
    }
    
  }
  
}
