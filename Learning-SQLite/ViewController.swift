//
//  ViewController.swift
//  Learning-SQLite
//
//  Created by Michael Malotte on 11/18/16.
//  Copyright © 2016 Michael Malotte. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    
//    Person.insert(value: "Mario")
//    Person.insert(value: "Luigi")
    
    Person.selectAll()
    
//    Post.insert(value: "Hi World")
//    Post.insert(value: "I are Bob")
    
    Post.selectAll()
    
    print(Person.collection.count)
    print(Post.collection.count)
    
  }

}

