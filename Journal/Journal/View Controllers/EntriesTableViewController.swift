//
//  EntriesTableViewController.swift
//  Journal
//
//  Created by Steven Leyva on 9/16/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit
import CoreData

class EntriesTableViewController: UITableViewController {
    
    var entries: [Entry] = []
    let entryController = EntryController()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return entryController.entries.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "JournalCell", for: indexPath) as? EntryTableViewCell else { return UITableViewCell() }
        let entry = entryController.entries[indexPath.row]
//        cell.textLabel?.text = entry.bodyText
//        cell.entryTitleLabel.text = entry.title
//        cell.timestampLabel.text = ("\(entry.timestamp)")
        cell.entry = entry
        
        

        return cell
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            let entry = entryController.entries[indexPath.row]
            
            entryController.delete(entry: entry)
            self.tableView.deleteRows(at: [indexPath], with: .fade)
    }
        
    }
    // MARK: - Navigation

   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "TableCellSegue" {
            guard let detailVC = segue.destination as? EntryDetailViewController,
                let indexPath = tableView.indexPathForSelectedRow else { return }
            
            detailVC.entry = entryController.entries[indexPath.row]
            detailVC.entrycontroller = entryController
        } else if segue.identifier == "AddSegue" {
            guard let detailVC = segue.destination as? EntryDetailViewController else { return }
            
            detailVC.entrycontroller = entryController
        }
    }
 

}

