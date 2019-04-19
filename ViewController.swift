//
//  ViewController.swift
//  CoreDataDemo
//
//  Created by vsoft on 19/04/19.
//  Copyright © 2019 com.vsoftcorp.arya. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    var context = NSManagedObjectContext()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.saveContext()
        self.fetchContext()
       

        // Do any additional setup after loading the view.
    }
    //MARK:- SAVE CONTEXT
    func saveContext(){
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        self.context = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "User", in: self.context)
        
        let newUser = NSManagedObject(entity: entity!, insertInto: self.context)
        newUser.setValue("manasa", forKey: "username")
        newUser.setValue("25", forKey: "age")
        newUser.setValue("123", forKey: "password")
            do{
                try self.context.save()
            }catch{
                
                print("failed to load")
            }
            print("saved object is :\(context)")
    }
      //MARK:- FETCH CONTEXT
    func fetchContext(){
        let reques  =  NSFetchRequest<NSFetchRequestResult>(entityName: "User")
        reques.returnsObjectsAsFaults = false
            do{
                let result = try self.context.fetch(reques)
                    for data in result as! [NSManagedObject]{
                        let value1 = data.value(forKey: "password")
                            print("The fetched data is :\(data)")
                            print("The fetched value1 is :\(value1)")
                    }
            }catch{
                print("failed to fetch")
            }
    }
}

