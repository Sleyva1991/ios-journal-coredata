//
//  EntryController.swift
//  Journal
//
//  Created by Steven Leyva on 9/16/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation
import CoreData




class EntryController {
    
//    var entries: [Entry] = {
//       return CoreDataStack.shared.loadFromPersistantStore()
//    }()

    func create(wtih title: String, bodyText: String, mood: String) {
        
//        let entry = Entry(title: title, bodyText: bodyText, mood: mood)
        let entry = Entry(title: title, bodyText: bodyText, mood: mood)
        
        
        CoreDataStack.shared.saveToPersistentStore()
    }
    
    func update(entry: Entry, with title: String, bodyText: String, mood: String) {
        
        entry.title = title
        entry.bodyText = bodyText
        entry.timestamp = Date()
        entry.identifier =  ""
        entry.mood = mood
        
        CoreDataStack.shared.saveToPersistentStore()
        
    }
    
    func delete(entry: Entry) {
        
        CoreDataStack.shared.mainContext.delete(entry)
        CoreDataStack.shared.saveToPersistentStore()
    }
    
    
}
