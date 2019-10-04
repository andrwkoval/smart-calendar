//
//  WhenTVC.swift
//  SmartCalendar
//
//  Created by Олександр Потапов on 10/4/19.
//  Copyright © 2019 oldschool-ucu-ios. All rights reserved.
//

import UIKit

class WhenTVC: UITableViewController {

    var lastSelection: IndexPath = IndexPath(row: 0, section: 0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.tableFooterView = UIView()
        
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let text = tableView.cellForRow(at: indexPath)?.textLabel?.text
        tableView.cellForRow(at: self.lastSelection)!.accessoryType = .none
        tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        self.lastSelection = indexPath
        tableView.deselectRow(at: indexPath, animated: true)
        if let text = text {
            self.delegate!.changeWhen(text)
        }
    }



}
