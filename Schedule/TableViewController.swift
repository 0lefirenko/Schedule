//
//  TableViewController.swift
//  Schedule
//
//  Created by Alexey on 22.02.2019.
//  Copyright © 2019 AO. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        var nextIndex : Int = 0
        var date = Date()
        let calendar = Calendar.current
        var currMin = (calendar.component(.weekday, from: date)-2)*1440+calendar.component(.hour, from: date)*60+calendar.component(.minute, from: date)
        print("Current:" + String(currMin))
if (Subjectc.count>0)
{        for i in 0...(Subjectc.count-1){
            let minn : Int = (Subjectc[i].Day)*1440 + Subjectc[i].Hour*60 + Subjectc[i].Minute
            if (currMin - 40 < minn) {
                nextIndex = i
                break
            }
        }
}
        print(nextIndex)
        if (nextIndex == -1) {nextIndex = 0}
if (Subjectc.count>0)       { nextIndex = nextIndex % Subjectc.count}
        var ans = ""
       if (Subjectc.count > 0){ ans = ((Subjectc[nextIndex].Name as? String)!) + " in " + ((Subjectc[nextIndex].Classroom as? String)!) + " at " + String(Subjectc[nextIndex].Hour) + ":" + String(Subjectc[nextIndex].Minute)
        }
        UserDefaults.init(suiteName: "group.com.scheduleproject")?.setValue(ans, forKey: "name")
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return Subjectc.count;
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let currentSubject = Subjectc[indexPath.row]
        let ans1 = ((currentSubject.Name as? String)!) + " in " + ((currentSubject.Classroom as? String)!)
        cell.textLabel?.text = ans1
        
        // Configure the cell...

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            //removeSubject(at: [indexPath])
            removeSubject(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func addButtonPress(_ sender: Any) {
        let newVC = storyboard?.instantiateViewController(withIdentifier: "addSubjectVC")
        present(newVC!, animated: true, completion: nil)
    }
    
    func reloadTableView(){
        tableView.reloadData()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
}
