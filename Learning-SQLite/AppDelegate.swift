//
//  AppDelegate.swift
//  Learning-SQLite
//
//  Created by Michael Malotte on 11/18/16.
//  Copyright © 2016 Michael Malotte. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
    // Override point for customization after application launch.
    
//    initDatabase()
//    copyDatabase()
    
    return true
  }

  func applicationWillResignActive(_ application: UIApplication) {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
  }

  func applicationDidEnterBackground(_ application: UIApplication) {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
  }

  func applicationWillEnterForeground(_ application: UIApplication) {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
  }

  func applicationDidBecomeActive(_ application: UIApplication) {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
  }

  func applicationWillTerminate(_ application: UIApplication) {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
  }
  
  func initDatabase(){
    
    Person.create()
    Post.create()
    
    if let joe: Int64 = Person.insert(name: "Joe") {
      Post.insert(person: joe, text: "hello?")
      Post.insert(person: joe, text: "My name is Joe.")
      Post.insert(person: joe, text: "meow")
    }
    
    if let suzy: Int64 = Person.insert(name: "Suzy") {
      Post.insert(person: suzy, text: "I'm Suzy")
      Post.insert(person: suzy, text: "Woof!")
    }
    
    if let bob: Int64 = Person.insert(name: "Bob") {
      Post.insert(person: bob, text: "Hey everybody!")
      Post.insert(person: bob, text: "Call me Bob")
    }
    
  }
  
  func copyDatabase(){
    
    let fileManager = FileManager.default
    
    let dbPath = getDBPath()
    let success = fileManager.fileExists(atPath: dbPath)
    
    if(!success) {
      if let defaultDBPath = Bundle.main.path(forResource: "test", ofType: "sqlite3")  {
      
        do {
          
          try fileManager.copyItem(atPath: defaultDBPath, toPath: dbPath)
          
        } catch let error {
          
          print("Failed to create writable database file with message \(error.localizedDescription))")
          
        }
        
        print(defaultDBPath)
       
      }else{
        print("Cannot Find File In NSBundle")
      }
    }else{
      print("File Already Exist At:\(dbPath)")
    }
  }
  
  
  func getDBPath()->String{
    
    return try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false).appendingPathComponent("test.sqlite3").path;
  }


}

