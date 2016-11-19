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
  
  static let instance = connect()
  
  private static let path = "/Users/Mickey/swift/Learning-SQLite/Learning-SQLite"
  
  static func connect() -> Connection? {

      do {
        return try Connection("\(path)/test.sqlite3")
      } catch {
        return nil
      }
    
    
  }
  
}
