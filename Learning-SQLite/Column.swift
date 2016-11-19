//
//  Column.swift
//  Learning-SQLite
//
//  Created by Michael Malotte on 11/19/16.
//  Copyright © 2016 Michael Malotte. All rights reserved.
//

import Foundation
import SQLite

class Column {
  static var id = Expression<Int64>("id")
  static var name = Expression<String>("name")
  static var text = Expression<String>("text")
}
