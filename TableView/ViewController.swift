//
//  ViewController.swift
//  TableView
//
//  Created by Гость on 11.07.17.
//  Copyright © 2017 ReturnOnIntelligence. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var list = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        list  = ["08:30", "09:30", "09:30", "10:30","11:30","12:30","13:30","14:30"]
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @available(iOS 2.0, *)
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    
    // Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
    // Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)
    
    @available(iOS 2.0, *)
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "cellTo")
        
        cell.textLabel?.text = list[indexPath.row]
        cell.textLabel?.textAlignment = NSTextAlignment.center
        return cell
    }
    
    

}

