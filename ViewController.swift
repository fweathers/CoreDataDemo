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

        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        let context = appDelegate.persistentContainer.viewContext // use context to access CoreData, save or restore data from the entity that was created
        
        let newUser = NSEntityDescription.insertNewObject(forEntityName: "Users", into: context)
        
        newUser.setValue("Felicia", forKey: "username")
        newUser.setValue("password1", forKey: "password")
        newUser.setValue(99, forKey: "age")
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

