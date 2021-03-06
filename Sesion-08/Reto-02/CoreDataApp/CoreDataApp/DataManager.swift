//
//  DataManager.swift
//  CoreDataApp
//
//  Copyright © 2020 Bedu. All rights reserved.
//

import UIKit
import CoreData

class DataManager {
  
  //CREATE
  func saveData(email: String, password: String) {
    guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
    let managedContext = appDelegate.persistentContainer.viewContext
    
    guard let entity = NSEntityDescription.entity(forEntityName: "User", in: managedContext) else { return }
    
    //Creation
    let user = NSManagedObject(entity: entity, insertInto: managedContext)
    user.setValue(email, forKey: "email")
    user.setValue(password, forKey: "password")
    
    // Save
    do {
      try managedContext.save()
    } catch let error {
      print("\(error)")
    }
  }
  
  //RETRIEVE
  func retrieve() -> NSManagedObject? {
    guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return nil }
    let managedContext = appDelegate.persistentContainer.viewContext
    let fetchRequest = NSFetchRequest<NSFetchRequestResult> (entityName: "User")
    fetchRequest.fetchLimit = 1
    
    //get data
    do {
      let result = try managedContext.fetch(fetchRequest)
      for data in result as! [NSManagedObject] {
        print(data)
        return data
      }
    } catch {
      return nil
    }
    return nil
  }
  
  // UPDATE
  // Update Password
  func update(email: String, password: String) {
    guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
    let managedContext = appDelegate.persistentContainer.viewContext
    let fetchRequest = NSFetchRequest<NSFetchRequestResult> (entityName: "User")
    fetchRequest.predicate = NSPredicate(format: "email = %@", email)
    do {
      let result = try managedContext.fetch(fetchRequest)
      let updateObject = result[0] as! NSManagedObject
      updateObject.setValue(password, forKey: "password")
      try managedContext.save()
    } catch {
    }
  }
  
  //DELETE
  func delete(email: String) {
    guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
    let managedContext = appDelegate.persistentContainer.viewContext
    let fetchRequest = NSFetchRequest<NSFetchRequestResult> (entityName: "User")
    fetchRequest.predicate = NSPredicate(format: "email = %@", email)
    
    do {
      let data = try managedContext.fetch(fetchRequest)
      let objectToDelete = data[0] as! NSManagedObject
      managedContext.delete(objectToDelete)
      try managedContext.save()
    } catch {
      
    }
  }
  
}
