//
//  NSManagedObject+Extension.swift
//  SmartETicket
//
//  Created by Ramprasad A on 16/07/18.
//  Copyright © 2018 Ramprasad A. All rights reserved.
//

import Foundation
import CoreData
import UIKit

extension NSManagedObject {
    
    static func getFetchRequest<T: NSManagedObject>() -> NSFetchRequest<T> {
        if #available(iOS 10.0, *) {
            return T.fetchRequest() as! NSFetchRequest<T>
        } else {
            let request = NSFetchRequest<T>(entityName: String(describing: T.self))
            return request
        }
    }
    
    static func initEntity<T: NSManagedObject>(context: NSManagedObjectContext? = nil) -> T {
        
        var objectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        if let value = context {
            objectContext = value
        }
        let entityDescritpion = NSEntityDescription.entity(forEntityName: String(describing: T.self), in: objectContext)!
        let entity = NSManagedObject(entity: entityDescritpion, insertInto: objectContext) as! T
        return entity
    }
}


