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
  
  var person: Row!
  var posts: Array<Row> = []

  override func viewDidLoad() {
    super.viewDidLoad()
    
    postTable.delegate = self
    postTable.dataSource = self
    
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(true)
    
    nameLabel.text = "\(person[C.name])s Posts"
    
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    
    if let newPostVC: NewPostVC = segue.destination as? NewPostVC {
      
      newPostVC.personVC = self
    }
    
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
      
      cell.postText.text = post[C.text]
      
      return cell
    }
    
    return UITableViewCell()
  }
  
  func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
    
    if editingStyle == .delete {
      
      let post = posts[indexPath.row]
      
      Post.delete(row: post)
      
      posts = Post.select(for: person)
     
      tableView.reloadData()
    }
    
  }
  
}
