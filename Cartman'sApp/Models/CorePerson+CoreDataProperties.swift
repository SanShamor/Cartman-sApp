//
//  CorePerson+CoreDataProperties.swift
//  Cartman'sApp
//
//  Created by Александр on 08.12.2021.
//
//

import Foundation
import CoreData


extension CorePerson {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CorePerson> {
        return NSFetchRequest<CorePerson>(entityName: "CorePerson")
    }

    @NSManaged public var age: Int16
    @NSManaged public var id: Int16
    @NSManaged public var name: String?
    @NSManaged public var occupation: String?
    @NSManaged public var religion: String?
    @NSManaged public var sex: String?

}

extension CorePerson : Identifiable {

}
