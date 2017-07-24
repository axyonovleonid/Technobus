//
//  TimeTableViewCell.swift
//  TableView
//
//  Created by Leonid on 17.07.17.
//  Copyright © 2017 ReturnOnIntelligence. All rights reserved.
//

import UIKit

class TimeTableViewCell: UITableViewCell {

//    @IBOutlet weak var sun: UILabel!
//    @IBOutlet weak var sat: UILabel!
    @IBOutlet weak var fri: UILabel!
    @IBOutlet weak var thu: UILabel!
    @IBOutlet weak var wed: UILabel!
    @IBOutlet weak var tue: UILabel!
    @IBOutlet weak var mon: UILabel!
    @IBOutlet weak var goneLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    var days:[UILabel]? = nil
    override func awakeFromNib() {
        days = [mon, tue, wed, thu, fri]
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    func customInit(sc:ScheduleViewController.TransferTime){
        goneLabel.isHidden = true
        let time = sc.time
        let mask = sc.mask
        goneLabel.isHidden = !sc.gone
        timeLabel.text = time
        let dayNubmer = (Date().dayNumberOfWeek()!+5)%7
        let count = days?.count
        let color = UIColor.init(red: 161.0/255.0, green: 40.0/255.0, blue: 48.0/255.0, alpha: 1.0)
        for i in 0..<count! {
            if(mask>>i)%2 == 0{
                days?[i].textColor = color
            }
            else {
                days?[i].textColor = UIColor.darkGray
            }
        }
        if(mask>>dayNubmer)%2 == 0 {
            timeLabel.textColor = UIColor.lightGray
            goneLabel.text = "Not today"
        }
        else {
            timeLabel.textColor = UIColor.black
            goneLabel.text = "Gone"

        }
    }
    
}

extension Date {
    func dayNumberOfWeek() -> Int? {
        return Calendar.current.dateComponents([.weekday], from: self).weekday
    }
}
