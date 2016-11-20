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
  
  private static let db = DB.instance
  
  private static let _post = Table("post")
  
  private static let _personID = Column.person_id
  private static let _postID = Column.post_id
  private static let _text = Column.text
  
  private static var _collection: Array<Row> = []
  
  static var collection: Array<Row> {
    get {
      return _collection
    }
  }
  
  static func loadCollection(){
    
    do {
      
      _collection = Array(try db.prepare(_post))
      
    } catch let error {
      print("Error: \(error)")
    }
    
  }
  
  static func insert(person: Int64, text: String){
    do {
      _ = try db.run(_post.insert(_personID <- person, _text <- text))
    } catch let error {
      print("Error: \(error)")
    }
  }
  
  
  static func delete(postRow: Row){
    
    let post = _post.filter(postRow[_postID] == _postID)
    
    do {
      
      _ = try db.run(post.delete())
      
    } catch let error {
      
      print(error)
      
    }
    
  }
  

  static func selectFor(person: Row) -> Array<Row> {
    
    let query = _post.filter(_personID == person[_personID])
    
    do {
      
      return Array(try db.prepare(query))
      
    } catch let error {
      
      print(error)
      
      return []
    }
    
  }

  
}
