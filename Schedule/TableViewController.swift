//
//  TableViewController.swift
//  Schedule
//
//  Created by Alexey on 18.02.2019.
//  Copyright © 2019 AO. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return Subjects.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let currentItem = Subjects[indexPath.row]
        cell.textLabel?.text = currentItem["Name"] as! String
        
        return cell;
    }
   
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            removeSubject(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    @IBAction func pushAddAction(_ sender: Any) {
        let alertController = UIAlertController(title: "Add new subject", message: "", preferredStyle: .alert)
        alertController.addTextField { (textField) in
            textField.placeholder = "Enter subject"
        }
        alertController.addTextField { (textField) in
            textField.placeholder = "Enter classroom"
        }
        
        alertController.addTextField { (textField) in
            textField.placeholder = "Enter time"
        }
        
        let alertAction1 = UIAlertAction(title: "Cancel", style: .default) { (alert) in
            
        }
        
        
        let alertAction2 = UIAlertAction(title: "Create", style: .default) { (alert) in
            //add new element
            let newSubject = alertController.textFields![0].text
            let classRoom = alertController.textFields![1].text
            let time = alertController.textFields![2].text
            addSubject(nameSubject: newSubject!, classRoom: classRoom!, time: time!)
            self.tableView.reloadData()
        }
        
        alertController.addAction(alertAction1)
        alertController.addAction(alertAction2)
        present(alertController, animated: true, completion: nil)
    }
    @IBAction func addButtonPress(_ sender: Any) {
        let newVC = storyboard?.instantiateViewController(withIdentifier: "addSubjectVC")
        present(newVC!, animated: true, completion: nil)
    }
}
