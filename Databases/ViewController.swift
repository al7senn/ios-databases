//
//  ViewController.swift
//  Databases
//
//  Created by Elijah on 10/3/17.
//  Copyright © 2017 Elijah. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    
        let student:Student = NSEntityDescription.insertNewObject(forEntityName: "Student", into: DatabaseController.getContext()) as! Student
        student.firstName = "Ellen"
        student.lastName = "DeGeneres"
        student.age = 23
        
        DatabaseController.saveContext()
        
        let fetchRequest:NSFetchRequest<Student> = Student.fetchRequest()
        
        do{
            let searchResults = try DatabaseController.getContext().fetch(fetchRequest)
            print("number of results: \(searchResults.count)")
            
            for result in searchResults as [Student]{
                print("\(result.firstName!) \(result.lastName!) is \(result.age) years old.")
            }
        }
        catch{
            print("Error: \(error)")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

