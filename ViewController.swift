//
//  ViewController.swift
//  CoreDataDemo
//
//  Created by Felicia Weathers on 10/14/16.
//  Copyright © 2016 Felicia Weathers. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let appDelegate = UIApplication.shared.delegate as! AppDelegate // refers to AppDelegate
        
        let context = appDelegate.persistentContainer.viewContext // use context to access CoreData, save or restore data from the entity that was created
        
        let newUser = NSEntityDescription.insertNewObject(forEntityName: "Users", into: context)
        
        newUser.setValue("Alex", forKey: "username")
        newUser.setValue("password1", forKey: "password")
        newUser.setValue(17, forKey: "age")
        
        do {
            
            try context.save()
            print("Saved")
            
        } catch {
            
            print("There was an error")
            
        }
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Users") //Allows user to get the data back from the database. Fetch everything within the entity "Users"
        
        request.predicate = NSPredicate(format: "username = %@", "Felicia") // To only return a particular value
        request.predicate = NSPredicate(format: "age >= %@", "50")
        
        request.returnsObjectsAsFaults = false
        
        do {
            
            let results = try context.fetch(request)
            
            if results.count > 0 {
                
                for result in results as! [NSManagedObject] {
                    
                    if let username = result.value(forKey: "username") as? String {
                        
                        print(username)
                    }
                    
                }
                
            } else {
                
                print("No results")
                
            }
            
        } catch {
            
            print("Couldn't fetch data")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

