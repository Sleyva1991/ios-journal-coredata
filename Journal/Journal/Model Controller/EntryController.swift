//
//  EntryController.swift
//  Journal
//
//  Created by Steven Leyva on 9/16/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

class EntryController {
    
    var entries: [Entry] = {
       return CoreDataStack.shared.loadFromPersistantStore()
    }()

   func create(wtih title: String, bodyText: String, timestamp: Date, identifier: String) {
        
        let _ = Entry(title: title, bodyText: bodyText, timestamp: Date(), identifier: "", context: CoreDataStack.shared.mainContext)
        
        CoreDataStack.shared.saveToPersistentStore()
    }
    
    func update(entry: Entry, with title: String, bodyText: String) {
        
        entry.title = title
        entry.bodyText = bodyText
        entry.timestamp = Date()
        entry.identifier =  ""
        
        CoreDataStack.shared.saveToPersistentStore()
        
    }
    
    func delete(entry: Entry) {
        
        CoreDataStack.shared.mainContext.delete(entry)
        CoreDataStack.shared.saveToPersistentStore()
    }
    
    
}
