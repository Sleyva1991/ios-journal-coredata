//
//  Entry+Convenience.swift
//  Journal
//
//  Created by Steven Leyva on 9/16/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation
import CoreData

extension Entry {
    
    convenience init(title: String, bodyText: String, timestamp: Date = Date(), identifier: String = UUID().uuidString, mood: String, context: NSManagedObjectContext = CoreDataStack.shared.mainContext) {
        
        self.init(context: context)
        
        self.title = title
        self.bodyText = bodyText
        self.timestamp = timestamp
        self.identifier = identifier
    }
    
}
