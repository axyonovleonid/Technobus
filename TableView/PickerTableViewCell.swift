//
//  PickerTableViewCell.swift
//  TableView
//
//  Created by Leonid on 18.07.17.
//  Copyright © 2017 ReturnOnIntelligence. All rights reserved.
//

import UIKit

class PickerTableViewCell: UITableViewCell {
    @IBOutlet weak var selectedDayTextField: UITextField!
    var selectedDay: String?
    var scheduleViewController: ScheduleViewController?
    let days = ["Any","Monday","Tuesday", "Wednesday", "Thursday", "Friday"]
    let dayPicker:UIPickerView? = nil

    override func awakeFromNib() {
        createDayPicker()
        createToolbar()
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func createDayPicker(){
        let dayPicker = UIPickerView()
        dayPicker.delegate = self
        selectedDayTextField.inputView = dayPicker
    }
    func createToolbar(){
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(dismissKeyboard))
        toolbar.setItems([doneButton], animated: false)
        toolbar.isUserInteractionEnabled = true
        
        selectedDayTextField.inputAccessoryView = toolbar
    }
    func dismissKeyboard(){
        superview?.endEditing(true)
    }
}

extension PickerTableViewCell: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int){
        selectedDay = days[row]
        selectedDayTextField.text = selectedDay
        scheduleViewController?.updateData(mask: (row == 0) ? 255 : 1<<(row-1))
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return days[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return days.count
    }
}
