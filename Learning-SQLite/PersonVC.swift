//
//  PersonVC.swift
//  Learning-SQLite
//
//  Created by Michael Malotte on 11/19/16.
//  Copyright © 2016 Michael Malotte. All rights reserved.
//

import UIKit
import SQLite

class PersonVC: UIViewController {
  
  @IBOutlet weak var postTable: UITableView!
  @IBOutlet weak var nameLabel: UILabel!
  
  var name: String!
  
  var posts: Array<Row> = []

  override func viewDidLoad() {
    super.viewDidLoad()
    
    postTable.delegate = self
    postTable.dataSource = self
    
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(true)
    
    nameLabel.text = name
    
  }


}

extension PersonVC: UITableViewDelegate, UITableViewDataSource {
  
  func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return posts.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    if let cell: PostCell = tableView.dequeueReusableCell(withIdentifier: "PostCell") as? PostCell {
      
      let post = posts[indexPath.row]
      
      cell.postText.text = post[Column.text]
      
      return cell
    }
    
    return UITableViewCell()
  }
  
}