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
  
  private let filepath = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false).appendingPathComponent("test.sqlite3").path
  
  init() {
    
    print(filepath)
    
    do {
      
      connection = try Connection(filepath)
      
      
    } catch let error {
      
      print(error)
      
    }
    
  }
  
}
