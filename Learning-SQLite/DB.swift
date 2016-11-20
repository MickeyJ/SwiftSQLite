//
//  Connection.swift
//  Learning-SQLite
//
//  Created by Michael Malotte on 11/19/16.
//  Copyright © 2016 Michael Malotte. All rights reserved.
//

import Foundation
import SQLite

class DB {
  
  static let instance = DB().connection!
  
  private var connection: Connection!
  
  private let path = "/Users/Mickey/swift/Learning-SQLite/Learning-SQLite"
  
  init() {
    
    do {
      
      connection = try Connection("\(path)/test.sqlite3")
      
      
    } catch let error {
      
      print(error)
      
    }
    
  }
  
}
