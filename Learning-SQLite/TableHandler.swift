//
//  TableHandler.swift
//  Learning-SQLite
//
//  Created by Michael Malotte on 11/20/16.
//  Copyright © 2016 Michael Malotte. All rights reserved.
//

import Foundation
import SQLite

protocol TableHandler {
  
  static var collection: Array<Row> { get }
  
  static func create()
  
  static func loadCollection()
  
  static func delete(row: Row)
  
}

