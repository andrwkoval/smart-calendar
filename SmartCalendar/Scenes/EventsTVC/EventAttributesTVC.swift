//
//  WhenTVC.swift
//  SmartCalendar
//
//  Created by Олександр Потапов on 10/4/19.
//  Copyright © 2019 oldschool-ucu-ios. All rights reserved.
//

import UIKit

class EventAttributesTVC: UITableViewController {

    var page: AttributePage?

    weak var delegate: EventAttributeIsChanged?

    var cellData: [String]?

    var lastSelection: IndexPath = IndexPath(row: 0, section: 0)

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.tableFooterView = UIView()

        self.selectRow()
    }

    func selectRow() {
        var index: Int = 0
        guard let page = page else { return }
        switch page {
        case .timeInterval:
            index = EventAttributes.shared.getCurrentTimeInterval()
        case .meetingDuration:
            index = EventAttributes.shared.getCurrentMeetingTime()
        default:
            print("🔥 unable to identify current attribute page")

        }
        let indexPath = IndexPath(row: index, section: 0)
        self.tableView.selectRow(at: indexPath, animated: false, scrollPosition: .none)
        self.tableView(self.tableView, didSelectRowAt: indexPath)
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellData?.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "reuseIdentifier")
        cell.textLabel?.text = cellData?[indexPath.row]
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: self.lastSelection)!.accessoryType = .none
        tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        self.lastSelection = indexPath
        tableView.deselectRow(at: indexPath, animated: true)

        switch page! {
        case .timeInterval:
            EventAttributes.shared.setTimeInterval(to: indexPath.row)
            self.delegate!.changeTimeInterval()
        case .meetingDuration:
            EventAttributes.shared.setMeetingDuration(to: indexPath.row)
            self.delegate!.changeMeetingDuration()
        default:
            print("🔥 unable to identify current attribute page")
        }
    }
}
