//
//  Column.swift
//  Learning-SQLite
//
//  Created by Michael Malotte on 11/19/16.
//  Copyright © 2016 Michael Malotte. All rights reserved.
//

import Foundation
import SQLite

class C {
  
  static var person_id = Expression<Int64>("person_id")
  static var name = Expression<String>("name")
  
  static var post_id = Expression<Int64>("post_id")
  static var text = Expression<String>("text")
}
