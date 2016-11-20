//
//  ViewController.swift
//  Learning-SQLite
//
//  Created by Michael Malotte on 11/18/16.
//  Copyright © 2016 Michael Malotte. All rights reserved.
//

import UIKit

class PeopleVC: UIViewController {
  
  @IBOutlet weak var peopleTable: UITableView!
  
  var selectedIndex: Int!

  override func viewDidLoad() {
    super.viewDidLoad()
    
    Person.loadCollection()
    
//    Post.loadCollection()
//    let person = Person.collection[2][Column.person_id]
//    Post.insert(person: person, text: "cheep cheep")
//    Post.insert(person: person, text: "I'm Joe Joe")
//    Post.selectFor(person: person)

    
    peopleTable.delegate = self
    peopleTable.dataSource = self

    print(Person.collection.count)
    print(Post.collection.count)
    
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    
    if let personVC: PersonVC = segue.destination as? PersonVC {
      
      let person = Person.collection[selectedIndex]
      
      personVC.person = person
      personVC.name = person[Column.name]
      personVC.posts = Post.selectFor(person: person)
      
    }
    
    if let newPersonVC: NewPersonVC = segue.destination as? NewPersonVC {
      
      newPersonVC.peopleVC = self
    }
    
  }

}

extension PeopleVC: UITableViewDelegate, UITableViewDataSource {
  
  func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return Person.collection.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    if let cell: PersonCell = tableView.dequeueReusableCell(withIdentifier: "PersonCell") as? PersonCell {
      
      let person = Person.collection[indexPath.row]
      
      cell.configure(person: person)
      
      return cell
    }
      
    return UITableViewCell()
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
    selectedIndex = indexPath.row
    
    performSegue(withIdentifier: "ShowPerson", sender: nil)
    
  }
  
  func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
    
    if editingStyle == .delete {
      
      let person = Person.collection[indexPath.row]
      
      Person.delete(personRow: person)
      
      Person.loadCollection()
      
      tableView.reloadData()
    }
    
  }
  
}
