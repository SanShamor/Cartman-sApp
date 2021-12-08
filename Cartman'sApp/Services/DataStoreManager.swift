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
    
    lazy var viewContext: NSManagedObjectContext = persistentContainer.viewContext
    
    lazy var persistentContainer: NSPersistentContainer = {
        
        let container = NSPersistentContainer(name: "Cartman_sApp")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
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
    
    func savePerson(person: PersonSouthPark) -> CorePerson {
        
        let user = CorePerson(context: viewContext)
        user.id = Int16(person.id)
        user.name = person.name
        user.age = Int16(person.age ?? Int.random(in: 5...55))
        user.sex = person.sex
        user.religion = person.religion
        user.occupation = person.occupation
        
        do {
            try viewContext.save()
        } catch let error {
            print("We have an error: \(error)")
        }
        
        return user
    }
    
    func getPersons() -> [CorePerson] {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "CorePerson")
        
        if let persons = try? viewContext.fetch(fetchRequest) as? [CorePerson], !persons.isEmpty {
            return persons
        } else {
            return []
        }
    }
    
}
