//
//  EntryDetailViewController.swift
//  Journal
//
//  Created by Steven Leyva on 9/16/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit
import CoreData

class EntryDetailViewController: UIViewController {
    
    var entry: Entry? {
        didSet {
            updateViews()
        }
    }
    var entrycontroller: EntryController?
    
    @IBOutlet weak var entryTitleTextfield: UITextField!
    @IBOutlet weak var journalTextView: UITextView!
    @IBOutlet weak var moodSegmentedControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    
    @IBAction func save(_ sender: Any) {
        
        guard let title = entryTitleTextfield.text,
            let journalText = journalTextView.text,
            !title.isEmpty else { return }
        
        let index = moodSegmentedControl.selectedSegmentIndex
        
        var mood1: String!
        
        switch index {
        case 0:
            mood1 = mood.bad.rawValue
        case 1:
            mood1 = mood.netrual.rawValue
        case 2:
            mood1 = mood.good.rawValue
        default:
            break
        }
        
        if let entry = entry {
            entry.title = title
            entry.bodyText = journalText
            
          entrycontroller?.update(entry: entry, with: title, bodyText: journalText, mood: mood1)
        } else {
          entrycontroller?.create(wtih: title, bodyText: journalText, mood: mood1)
        }
        
        navigationController?.popViewController(animated: true)
        
    }
    func updateViews() {
        guard let entry = entry,
            isViewLoaded else {
                title = "Create Entry"
                return
        }
        
        title = entry.title
        entryTitleTextfield.text = entry.title
        journalTextView.text = entry.bodyText
            
           var index = 0
        
        switch entry.mood {
        case mood.bad.rawValue:
            index = 0
        case mood.netrual.rawValue:
            index = 1
        case mood.good.rawValue:
            index = 2
        default:
            break
        }
        moodSegmentedControl.selectedSegmentIndex = index
    }

}
