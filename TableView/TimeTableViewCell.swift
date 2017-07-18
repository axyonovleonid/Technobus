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
        let color = UIColor.darkGray
        self.mon.textColor = color
        self.tue.textColor = color
        self.wed.textColor = color
        self.thu.textColor = color
        self.fri.textColor = color
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
        goneLabel.isHidden = !sc.gone
        timeLabel.text = time
        
        let color = UIColor.init(red: 161.0/255.0, green: 40.0/255.0, blue: 48.0/255.0, alpha: 1.0)
        if(mask>>0)%2 == 0 {
//            let attributeString: NSMutableAttributedString =  NSMutableAttributedString(string: mon.text!)
//            attributeString.addAttribute(NSForegroundColorAttributeName, value: UIColor.brown, range: NSMakeRange(0, attributeString.length))
//            mon.attributedText = attributeString
            
            self.mon.textColor = color
        }
        if(mask>>1)%2 == 0 {
            self.tue.textColor = color
        }
        if(mask>>2)%2 == 0 {
            self.wed.textColor = color
        }
        if(mask>>3)%2 == 0 {
            self.thu.textColor = color
        }
        if(mask>>4)%2 == 0 {
            self.fri.textColor = color
        }
    }
    
}
