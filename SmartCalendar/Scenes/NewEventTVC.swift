//
//  NewEventTVC.swift
//  SmartCalendar
//
//  Created by Олександр Потапов on 10/4/19.
//  Copyright © 2019 oldschool-ucu-ios. All rights reserved.
//

import UIKit

protocol EventAttributeIsChanged: class {
    func changeWhen(_ time: String)
    func changeMeetingDuration(_ time: String)
    func changeTravelTime(_ time: String)
    func changeInvitees(_ people: Any)
    func changeAlert(_ time: String)
}

class NewEventTVC: UITableViewController {
    
    var whenInterval: String = "Next Week"
    var travelTime: String = "None"
    var meetingTimeDuration: String = "1 hour"

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.tableFooterView = UIView()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let returnedView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: tableView.sectionHeaderHeight))
        returnedView.backgroundColor = #colorLiteral(red: 0.937254902, green: 0.937254902, blue: 0.9568627451, alpha: 1)
        return returnedView
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        let title = cell?.textLabel?.text
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        var vc: UITableViewController?
        switch title {
        case "When":
            vc = storyBoard.instantiateViewController(withIdentifier: "WhenTVC") as? WhenTVC
        case "Meeting time":
            vc = storyBoard.instantiateViewController(withIdentifier: "MeetingTimeTVC") as? MeetingTimeTVC
        case "Average Travel Time":
            vc = storyBoard.instantiateViewController(withIdentifier: "TravelTimeTVC") as? TravelTimeTVC
        case "Invitees":
            print("\(indexPath)")
        case "Alert":
            print("\(indexPath)")
        default:
            print(" ")
        }

        if let vc = vc {
            vc.delegate = self
            vc.title = title
            navigationController?.pushViewController(vc, animated: true)
        }

    }

    func changeCellStateLabel(for cell: String) {
        switch cell {
        case "When":
            tableView.cellForRow(at: IndexPath(row: 0, section: 1))?.detailTextLabel!.text = self.whenInterval
        case "Meeting time":
            tableView.cellForRow(at: IndexPath(row: 2, section: 1))?.detailTextLabel!.text = self.meetingTimeDuration
        case "Average Travel Time":
            tableView.cellForRow(at: IndexPath(row: 3, section: 1))?.detailTextLabel!.text = self.travelTime
        default:
            print("❗️Could not change cell`s attributed state")
        }
    }

}

extension NewEventTVC: EventAttributeIsChanged {
    func changeWhen(_ time: String) {
        self.whenInterval = time
        self.changeCellStateLabel(for: "When")
    }
    func changeMeetingDuration(_ time: String) {
        self.meetingTimeDuration = time
    }

    func changeTravelTime(_ time: String) {
        self.travelTime = time
    }

    func changeInvitees(_ people: Any) {

    }

    func changeAlert(_ time: String) {
        
    }
}
