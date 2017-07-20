//
//  SwTableViewCell.swift
//  TableView
//
//  Created by Leonid on 16.07.17.
//  Copyright © 2017 ReturnOnIntelligence. All rights reserved.
//

import UIKit

class SwTableViewCell: UITableViewCell {

    static let shared = SwTableViewCell.init()
    
    var controllers: [ScheduleViewController]? = nil

    @IBAction func onSwitched(_ sender: Any) {
        if(sw.isOn){
            label.text = "Show More"
//            scheduleViewController!.updateData(mask: (scheduleViewController?.dayMask)!)
        }
        else{
            label.text = "Show Less"
//            scheduleViewController!.updateData(mask: (scheduleViewController?.dayMask)!)
        }
        for contr in controllers! {
            contr.updateData(mask: (contr.dayMask))
        }
    }
    
    @IBOutlet weak var sw: UISwitch!
    @IBOutlet weak var label: UILabel!
    
    func setCallBack(contr: ScheduleViewController){
        controllers?.append(contr)
    }
    
    override func awakeFromNib() {
        controllers = []
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    func customInit(_ svc: ScheduleViewController){
        controllers?.append(svc)
    }

}


