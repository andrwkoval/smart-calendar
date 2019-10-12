//
//  EventAttributes.swift
//  SmartCalendar
//
//  Created by Олександр Потапов on 11.10.2019.
//  Copyright © 2019 oldschool-ucu-ios. All rights reserved.
//

import Foundation

class EventAttributes {

    static let shared = EventAttributes()

    private let timeIntervals = [
        "Today", "This Week", "Next Week", "This Month", "Next Month"
    ]

    private let meetingDurations = [
        "None", "5 minutes", "15 minutes", "30 minutes", "1 hour", "1 hour, 30 minutes", "2 hours"
    ]

    private var invitee: String = "None"

    private var timeInterval: Int = 0

    private var meetingDuration: Int = 0

    private init() {

    }

    func setTimeInterval(to index: Int) {
        self.timeInterval = index
    }

    func setMeetingDuration(to index: Int) {
        self.meetingDuration = index
    }

    func setInviteee(to text: String) {
        self.invitee = text
    }

    func getCurrentTimeInterval() -> String {
        return self.timeIntervals[self.timeInterval]
    }

    func getCurrentMeetingTime() -> String {
        return self.meetingDurations[self.meetingDuration]
    }

    func getCurrentInvitee() -> String {
        return self.invitee
    }

    func getCurrentTimeInterval() -> Int {
        return self.timeInterval
    }

    func getCurrentMeetingTime() -> Int {
        return self.meetingDuration
    }

    func getTimeIntervals() -> [String] {
        return self.timeIntervals
    }

    func getMeetingDurations() -> [String] {
        return self.meetingDurations
    }

    func getInvitee() {

    }

}
