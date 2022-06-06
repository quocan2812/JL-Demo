//
//  CoredataWorker.swift
//  JLDemo
//
//  Created by VN01-MAC-0005 on 04/06/2022.
//

import Foundation
import UIKit
import CoreData

protocol CoreDataWorkerProtocol {
    
    func getDataFromLocal(onSuccess: @escaping ([AnyObject]) -> Void, onFail: @escaping (Error?) -> Void)
    
}

final class CoreDataWorker : CoreDataWorkerProtocol {
    
    // insert Dummy data demo to database
    func createDataDemo()  {
        
        let dataCreatedKeyFlag = "createdDataDemo"
        //check data demo
        let dataCreated = UserDefaults.standard.bool(forKey: dataCreatedKeyFlag)
        guard !dataCreated else { return }
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            print("Could not save")
            return
            
        }
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let entity1 = NSEntityDescription.entity(forEntityName: "ItemToSell", in: managedContext)!
        
        let item1 = ItemToSell(entity: entity1, insertInto: managedContext)
        
        item1.id = 3
        item1.name = "Table"
        item1.price = 12000
        item1.quantity = 1
        item1.type = 2
        
        let entity2 = NSEntityDescription.entity(forEntityName: "ItemToSell", in: managedContext)!
        
        let item2 = ItemToSell(entity: entity2, insertInto: managedContext)
        
        item2.id = 2
        item2.name = "TV"
        item2.price = 38000
        item2.quantity = 2
        item2.type = 2
        
        let entity3 = NSEntityDescription.entity(forEntityName: "ItemToSell", in: managedContext)!
        
        let item3 = ItemToSell(entity: entity3, insertInto: managedContext)
        
        item3.id = 1
        item3.name = "iPhone X"
        item3.price = 150000
        item3.quantity = 1
        item3.type = 2
        
        //save context
        do {
            try managedContext.save()
            UserDefaults.standard.set(true, forKey: dataCreatedKeyFlag)
            print("Insert Success")
            
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
  
    }
    
    func getDataFromLocal(onSuccess: @escaping ([AnyObject]) -> Void, onFail: @escaping (Error?) -> Void) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            onFail(nil)
            return
            
        }
        
        let managedContext = appDelegate.persistentContainer.newBackgroundContext()
        managedContext.automaticallyMergesChangesFromParent = true
        
        managedContext.perform {
            do {
                let fetchRequest = ItemToSell.fetchRequest()
                let sort = NSSortDescriptor(key: "id", ascending: true)
                fetchRequest.sortDescriptors = [sort]
                let itemToSells = try managedContext.fetch(fetchRequest)
                
                onSuccess(itemToSells)
                
            }
            
            catch let error {
                onFail(error)
                
            }
        }
    }
     
}
