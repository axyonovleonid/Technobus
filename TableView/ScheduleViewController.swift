//
//  ScheduleViewController.swift
//  TableView
//
//  Created by Leonid on 12.07.17.
//  Copyright © 2017 ReturnOnIntelligence. All rights reserved.
//

import UIKit

class ScheduleViewController: UITableViewController {
    var list=[String]()
    struct TransferTime{
        let time: String
        let mask: Int
        init(t: String, m: Int){
            time = t
            mask = m
        }
    }
    
    func getSchedule(id:String) -> [TransferTime]{
        let filePath = "Users/leonid/Desktop/schedule.json"

        
        var schedule = [TransferTime]()
        let data = try? Data.init(contentsOf: URL.init(fileURLWithPath: filePath))
        do{
            let json = try JSONSerialization.jsonObject(with: data!) as? [String: Any]
            let toOffice = json![id] as? [[String:Any]]
            for sched in toOffice! {
                let t = sched["time"] as? String
                let m = sched["mask"] as? NSNumber

                schedule.append(TransferTime(t: t!, m: Int.init(m!)))
            }
            
        } catch {
            print("Error with JSON: \(error)")
        }
        return schedule
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let schedule = getSchedule(id: self.restorationIdentifier!)
//        switch self.restorationIdentifier! {
//        case "toScheduleController":
//            list = ["11:30", "12:30"]
//        case "fromScheduleController":
//            list = ["10:30", "13:30"]
//        default:
//            break
//        }
        for sc in schedule{
            list.append(sc.time)
        }
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return list.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "cell")
        cell.textLabel?.text = list[indexPath.row]
        cell.textLabel?.textAlignment = NSTextAlignment.center
        return cell
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
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
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
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
