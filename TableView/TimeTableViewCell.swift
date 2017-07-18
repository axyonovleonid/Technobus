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
    override func awakeFromNib() {
        let color = UIColor.init(red: 161.0/255.0, green: 40.0/255.0, blue: 48.0/255.0, alpha: 1.0)
        
        mon.textColor = color
        tue.textColor = color
        wed.textColor = color
        thu.textColor = color
        fri.textColor = color
        super.awakeFromNib()
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func customInit(sc:ScheduleViewController.TransferTime){
        goneLabel.isHidden = true
        let time = sc.time
        let mask = sc.mask
        timeLabel.text = time
        let color = UIColor.darkGray
        if(mask>>0)&0b00000001 == 0b00000001 {
            mon.textColor = color
        }
        if(mask>>1)&0b00000001 == 0b00000001 {
            tue.textColor = color
        }
        if(mask>>2)&0b00000001 == 0b00000001 {
            wed.textColor = color
        }
        if(mask>>3)&0b00000001 == 0b00000001 {
            thu.textColor = color
        }
        if(mask>>4)&0b00000001 == 0b00000001 {
            fri.textColor = color
        }
    }
    
}
