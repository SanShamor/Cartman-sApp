//
//  DataStoreManager.swift
//  Cartman'sApp
//
//  Created by Александр on 08.12.2021.
//

import Foundation
import CoreData

class DataStoreManager {
    
    // MARK: - Core Data stack
        
    lazy var persistentContainer: NSPersistentContainer = {
        
        let container = NSPersistentContainer(name: "Cartman_sApp")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    lazy var viewContext: NSManagedObjectContext = persistentContainer.viewContext
    
    // MARK: - CRUD
    
    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    func obtainMainUser(character: CharacterPerson) -> CorePerson {
        
        let user = CorePerson(context: viewContext)
        user.id = Int16(character.id)
        user.name = character.name
        user.age = Int16(character.age ?? Int.random(in: 5...55))
        user.sex = character.sex
        user.religion = character.religion
        user.occupation = character.occupation
        
        do {
            try viewContext.save()
        } catch let error {
            print("We have an error: \(error)")
        }
        
        return user
    }
    
    func updateMainUser() -> [CorePerson] {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "CorePerson")
        
        if let users = try? viewContext.fetch(fetchRequest) as? [CorePerson], !users.isEmpty {
            return users
        } else {
            return []
        }
    }
    
}
