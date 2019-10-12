//
//  NewEventTVC.swift
//  SmartCalendar
//
//  Created by Олександр Потапов on 10/4/19.
//  Copyright © 2019 oldschool-ucu-ios. All rights reserved.
//

import UIKit

protocol EventAttributeIsChanged: class {
    func changeTimeInterval()
    func changeMeetingDuration()
    func changeInvitee()
}

public enum AttributePage {
    case timeInterval
    case meetingDuration
    case invitee
}

class NewEventTVC: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.tableFooterView = UIView()
        changeTimeInterval()
        changeMeetingDuration()
    }

    @IBAction func done(_ sender: Any) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let tvc = storyBoard.instantiateViewController(withIdentifier: "EventAttributesTVC") as? EventAttributesTVC
        tvc?.cellData = EventResultsManager.shared.intersect
        tvc?.title = "Free time"
        navigationController?.pushViewController(tvc!, animated: true)
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let tvc = storyBoard.instantiateViewController(withIdentifier: "EventAttributesTVC") as? EventAttributesTVC
        switch indexPath.section {
        case 1:
            tvc?.cellData = EventAttributes.shared.getTimeIntervals()
            tvc?.page = AttributePage.timeInterval
            tvc?.title = "When"
        case 3:
            tvc?.cellData = EventAttributes.shared.getMeetingDurations()
            tvc?.page = AttributePage.meetingDuration
            tvc?.title = "Meeting duration"
        case 4:
            let storyboard: UIStoryboard = UIStoryboard(name: "UserSearch", bundle: nil)
            let usersVC = storyboard.instantiateViewController(withIdentifier: "SearchUsersCalendarVC") as? SearchUsersCalendarVC
                navigationController?.pushViewController(usersVC!, animated: true)
                usersVC!.delegate = self
                return
        default:
            print(" ")
        }

        if let tvc = tvc {
            tvc.delegate = self 
            tvc.title = title
            navigationController?.pushViewController(tvc, animated: true)
        }

    }

    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let returnedView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: tableView.sectionHeaderHeight))
        returnedView.backgroundColor = #colorLiteral(red: 0.937254902, green: 0.937254902, blue: 0.9568627451, alpha: 1)
        return returnedView
    }

}

extension NewEventTVC: EventAttributeIsChanged {
    func changeTimeInterval() {
        let cell = tableView.cellForRow(at: IndexPath(row: 0, section: 1))
        cell?.detailTextLabel?.text = EventAttributes.shared.getCurrentTimeInterval()
    }

    func changeMeetingDuration() {
        let cell = tableView.cellForRow(at: IndexPath(row: 0, section: 3))
        cell?.detailTextLabel?.text = EventAttributes.shared.getCurrentMeetingTime()
    }

    func changeInvitee() {
        let cell = tableView.cellForRow(at: IndexPath(row: 0, section: 4))
        cell?.detailTextLabel?.text = EventAttributes.shared.getCurrentInvitee()
    }
}
