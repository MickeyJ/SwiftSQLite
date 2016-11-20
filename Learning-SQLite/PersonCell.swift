//
//  PersonCell.swift
//  Learning-SQLite
//
//  Created by Michael Malotte on 11/19/16.
//  Copyright © 2016 Michael Malotte. All rights reserved.
//

import UIKit
import SQLite

class PersonCell: UITableViewCell {
  
  @IBOutlet weak var nameLabel: UILabel!
  
  var id: Int64!

  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    
  }
  
  func configure(person: Row){
    
    id = person[C.person_id]
    nameLabel.text = person[C.name]
    
  }

}
