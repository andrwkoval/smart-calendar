//
//  TemporareStorage.swift
//  SmartCalendar
//
//  Created by Олександр Потапов on 12.10.2019.
//  Copyright © 2019 oldschool-ucu-ios. All rights reserved.
//

import Foundation

class EventResultsManager {

    static let shared = EventResultsManager()

    let events = [
        "12/10/2019 18:00-19:00",
        "14/10/2019 8:30-13:00",
        "15/10/2019 8:30-13:00",
        "15/10/2019 16:00-17:20",
        "16/10/2019 8:30-13:00",
        "17/10/2019 8:30-13:00",
    ]

    let intersect = [
           "12/10/2019 8:30-18:00",
           "12/10/2019 19:00-23:00",
           "14/10/2019 13:00-23:00",
           "15/10/2019 13:00-23:00",
           "15/10/2019 9:30-16:00",
           "15/10/2019 17:20-23:00",
           "16/10/2019 13:00-23:00",
           "17/10/2019 13:00-23:00",]
    private init() {

    }
}
