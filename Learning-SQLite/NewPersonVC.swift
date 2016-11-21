//
//  NewPersonVC.swift
//  Learning-SQLite
//
//  Created by Michael Malotte on 11/19/16.
//  Copyright © 2016 Michael Malotte. All rights reserved.
//

import UIKit

class NewPersonVC: UIViewController {

  @IBOutlet weak var newPersonField: UITextField!
  
  var peopleVC = PeopleVC()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
  }

  @IBAction func onCancelPress(_ sender: Any) {
    
    dismiss(animated: true, completion: nil)
    
  }
  
  @IBAction func onSavePress(_ sender: Any) {
    
    if let name: String = newPersonField.text, newPersonField.text != "" {
      
      _ = Person.insert(name: name)
      
      Person.loadCollection()
      
      peopleVC.peopleTable.reloadData()
      
      dismiss(animated: true, completion: nil)
      
    }
    
  }

}
