//
//  ScheduleViewController.swift
//  TableView
//
//  Created by Leonid on 12.07.17.
//  Copyright © 2017 ReturnOnIntelligence. All rights reserved.
//

import UIKit

class ScheduleViewController: UITableViewController {
    var list = [TransferTime]()
    var schedule = [TransferTime]()
    var sw = UISwitch()
    static var switchCell: SwTableViewCell? = nil
    static var pickerCell: PickerTableViewCell? = nil
    var sectionCount = [Int?]()
    let sectionNames = ["Settings", "Time"]
    var dayMask = 255
//    var timeCells = [TimeTableViewCell]
    struct TransferTime{
        let time: String
        let mask: Int
        var gone: Bool
        init(t: String, m: Int, g: Bool){
            time = t
            mask = m
            gone = g
        }
    }
    
    func getSchedule(id:String) -> [TransferTime]{
        let urlpath  = Bundle.main.path(forResource: "schedule", ofType: "json")
        let filePath = URL.init(fileURLWithPath: urlpath!)
        var schedule = [TransferTime]()
        let data:Data
        data = try! Data.init(contentsOf: URL.init(string: "http://195.62.49.18/schedule")!)

        do{
            let json = try JSONSerialization.jsonObject(with: data) as? [String: Any]
            let toOffice = json![id] as? [[String:Any]]
            for sched in toOffice! {
                let t = sched["time"] as? String
                let m = sched["mask"] as? NSNumber

                schedule.append(TransferTime(t: t!, m: Int.init(m!), g: false))
            }
            
        } catch {
            print("Error with JSON: \(error)")
        }
        return schedule
    }
    
 

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let nibSw = UINib(nibName: "SwTableViewCell", bundle: nil)
        tableView.register(nibSw, forCellReuseIdentifier: "swCell")
        let nibTime = UINib(nibName: "TimeTableViewCell", bundle: nil)
        tableView.register(nibTime, forCellReuseIdentifier: "timeCell")
        let nibPicker = UINib(nibName: "PickerTableViewCell", bundle: nil)
        tableView.register(nibPicker, forCellReuseIdentifier: "pickerCell")
        
        schedule = getSchedule(id: self.restorationIdentifier!)

        for sc in schedule{
            list.append(sc)
        }
        tableView.estimatedRowHeight = 99.0
        tableView.rowHeight = UITableViewAutomaticDimension

        if(ScheduleViewController.switchCell == nil) {
            let cell = tableView.dequeueReusableCell(withIdentifier: "swCell") as? SwTableViewCell
            ScheduleViewController.switchCell = cell
        }
        ScheduleViewController.switchCell.setCallBack(contr: self)
        sw  = (ScheduleViewController.switchCell?.sw)!
        
        
        sectionCount = [2, list.count]
        updateData(mask: dayMask)
        tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sectionCount[section]!
    }

    
    func updateData(mask: Int){
        let date = NSDate()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        dateFormatter.locale = Locale.current
        let time = dateFormatter.string(from: date as Date)
        list = []
        
        for var sc in schedule {
            if(sc.mask&mask > 0) {
                if(sw.isOn && (time < sc.time)) {
                    list.append(sc)
                }
                else if(!sw.isOn){
                    if(time > sc.time) {
                        sc.gone = true
                    }
                    list.append(sc)
                }
            }
        }
        sectionCount[1] = list.count
        tableView.reloadData()
    }
    
//    override func viewWillAppear(_ animated: Bool) {
//        updateData(mask: dayMask)
//        tableView.reloadData()
//    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {   return sectionNames[section]
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell
        if (indexPath.section == 0){
            if(indexPath.row == 0){
//                cell = ScheduleViewController.switchCell!
                ScheduleViewController.switchCell?.awakeFromNib()
                return ScheduleViewController.switchCell!
            }
            else {
                if(ScheduleViewController.pickerCell == nil){
                    cell = tableView.dequeueReusableCell(withIdentifier: "pickerCell") as! PickerTableViewCell
                    ScheduleViewController.pickerCell = cell as? PickerTableViewCell
                    ScheduleViewController.pickerCell?.scheduleViewController = self
                }
                else {
                    cell = ScheduleViewController.pickerCell!
                }
            }
        }
        else {
            cell = tableView.dequeueReusableCell(withIdentifier: "timeCell") as! TimeTableViewCell
            let timeCell = cell as? TimeTableViewCell
            timeCell?.customInit(sc: list[indexPath.row])
        }
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


