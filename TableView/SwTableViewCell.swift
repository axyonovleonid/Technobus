//
//  SwTableViewCell.swift
//  TableView
//
//  Created by Leonid on 16.07.17.
//  Copyright © 2017 ReturnOnIntelligence. All rights reserved.
//

import UIKit

class SwTableViewCell: UITableViewCell {

    var sheduleViewController: ScheduleViewController?

    @IBAction func onSwitched(_ sender: Any) {
        if(sw.isOn){
            label.text = "Show More"
            sheduleViewController!.updateData()
        }
        else{
            label.text = "Show Less"
            sheduleViewController!.updateData()
        }
    }
    
    @IBOutlet weak var sw: UISwitch!
    @IBOutlet weak var label: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }

    func customInit(_ svc: ScheduleViewController){
        sheduleViewController = svc
    }
    
}
