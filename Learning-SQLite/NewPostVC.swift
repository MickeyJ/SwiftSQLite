//
//  NewPostVC.swift
//  Learning-SQLite
//
//  Created by Michael Malotte on 11/19/16.
//  Copyright © 2016 Michael Malotte. All rights reserved.
//

import UIKit

class NewPostVC: UIViewController {
  
  @IBOutlet weak var newPostField: UITextField!
  
  var personVC = PersonVC()

  override func viewDidLoad() {
    super.viewDidLoad()
    
  }
  
  @IBAction func onCancelPress(_ sender: Any) {
    
    dismiss(animated: true, completion: nil)
    
  }

  @IBAction func onSavePress(_ sender: Any) {
    
    if let text = newPostField.text, newPostField.text != "" {
      
      let person = personVC.person!
      
      Post.insert(person: person[Column.person_id], text: text)
      
      personVC.posts = Post.selectFor(person: person)
      
      personVC.postTable.reloadData()
      
      dismiss(animated: true, completion: nil)
    }
    
    
    
  }
}
