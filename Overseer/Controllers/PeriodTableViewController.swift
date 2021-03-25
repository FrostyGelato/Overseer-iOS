//
//  PeriodTableViewController.swift
//  Overseer
//
//  Created by Joshua Fan on 10/20/20.
//  Copyright © 2020 joshuafan. All rights reserved.
//

import UIKit

// Main Menu
class PeriodTableViewController: UITableViewController {
    
    //MARK: - Properties
    
    var periodList = [Period]()
    let periodDBManager = PeriodDBManager()

    //MARK: - Navigation
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        periodDBManager.createPeriodTable()
        
        periodList = periodDBManager.getPeriods()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    // Runs when save button in PeriodViewController is pressed
    @IBAction func refreshList(sender: UIStoryboardSegue) {
        
        /*if let sourceViewController = sender.source as? PeriodViewController, let task = sourceViewController.task {
            
            let taskManager = TaskDBManager()
            taskManager.createTaskTable()
            taskManager.addTask(task.name, task.timeRequired, task.deadline)
            taskManager.getTasks()
        }*/
        
        // Refresh list when user returns to main menu
        refreshPeriodList()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return periodList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellIdentifier = "PeriodTableViewCell"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? PeriodTableViewCell else {
            fatalError("The dequeued cell is not an instance of PeriodTableViewCell.")
        }
        
        let period = periodList[indexPath.row]
        
        cell.icon.image = UIImage(systemName: "square")
        cell.nameLabel.text = period.name
        //cell.timeLabel.text = period.startTime + " - " + period.endTime
        
        return cell
    }
    
    //MARK: - Private Methods
    
    // Refreshes list (exclude initial loading)
    private func refreshPeriodList() {
        
        periodList = periodDBManager.getPeriods()
        
        // Updates table view
        self.tableView.reloadData()
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

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
}
