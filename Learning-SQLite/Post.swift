//
//  Post.swift
//  Learning-SQLite
//
//  Created by Michael Malotte on 11/19/16.
//  Copyright © 2016 Michael Malotte. All rights reserved.
//

import Foundation
import SQLite

class Post: TableHandler {
  
  private static let db = DB.instance
  
  private static let _person = T.Person
  private static let _post = T.Post
  
  private static let _personID = C.person_id
  private static let _postID = C.post_id
  private static let _text = C.text
  
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
  
  static func create(){
    
    do {
      
      try db.run(_post.create { t in
        t.column(_postID, primaryKey: .autoincrement)
        t.column(_personID)
        t.column(_text)
      })
      
    } catch {
      
      
      
    }
    
  }
  
  static func insert(personID: Int64, text: String){
    do {
      _ = try db.run(_post.insert(_personID <- personID, _text <- text))
    } catch let error {
      print("Error: \(error)")
    }
  }
  
  
  static func delete(row: Row){
    
    let post = _post.filter(row[_postID] == _postID)
    
    do {
      
      _ = try db.run(post.delete())
      
    } catch let error {
      
      print(error)
      
    }
    
  }
  

  static func select(for person: Row) -> Array<Row> {
    
    let query = _post.filter(_personID == person[_personID])
    
    do {
      
      return Array(try db.prepare(query))
      
    } catch let error {
      
      print(error)
      
      return []
    }
    
  }
  
}
