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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    
    @IBAction func save(_ sender: Any) {
        
        guard let title = entryTitleTextfield.text,
            let journalText = journalTextView.text,
            !title.isEmpty else { return }
        
        if let entry = entry {
            entry.title = title
            entry.bodyText = journalText
            
          entrycontroller?.update(entry: entry, with: title, bodyText: journalText)
        } else {
          entrycontroller?.create(wtih: title, bodyText: journalText, timestamp: Date(), identifier: "")
        }
        
        navigationController?.popViewController(animated: true)
        
    }
    func updateViews() {
        
        if isViewLoaded == true {
        title = entry?.title ?? "Create Entry"
        entryTitleTextfield.text = entry?.title
        journalTextView.text = entry?.bodyText
        }
    }

}
