//
//  Post.swift
//  Learning-SQLite
//
//  Created by Michael Malotte on 11/19/16.
//  Copyright © 2016 Michael Malotte. All rights reserved.
//

import Foundation
import SQLite

class Post {
  
  private static let db = DB.instance!
  
  private static let post = Table("post")
  
  private static let id = Column.id
  private static let text = Column.text
  
  static var collection: Array<Row> = []
  
  static func insert(value: String){
    do {
      _ = try db.run(post.insert(text <- value))
    } catch {
      print("Error: \(error)")
    }
  }
  
  static func selectAll(){
    
    do {
      let selection = try db.prepare(post)
      
      print("")
      print("     Posts")
      print("————————————————")
      for row in selection {
        print("id: \(row[id]), text: \(row[text])")
        collection.append(row)
      }
      
    } catch let error {
      print("Error: \(error)")
    }
    
  }

  
}
