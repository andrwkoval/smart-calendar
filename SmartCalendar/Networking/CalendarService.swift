//
//  CalendarService.swift
//  SmartCalendar
//
//  Created by Yevhenii Orenchuk on 10/4/19.
//  Copyright © 2019 oldschool-ucu-ios. All rights reserved.
//

import Foundation
import GoogleSignIn
import GoogleAPIClientForREST
import GTMSessionFetcher

final class CalendarService {
    
    // MARK: - Properties
    
    static let shared = CalendarService()
    
    private lazy var service: GTLRCalendarService? = {
        let calendarService = GTLRCalendarService()
        // Have the service object set tickets to fetch consecutive pages
        // of the feed so we do not need to manually fetch them
        calendarService.shouldFetchNextPages = true
        // Have the service object set tickets to retry temporary error conditions
        // automatically
        calendarService.isRetryEnabled = true
        calendarService.maxRetryInterval = 15

        guard let currentUser = GIDSignIn.sharedInstance().currentUser,
            let authentication = currentUser.authentication else {
                return nil
        }
        
        calendarService.authorizer = authentication.fetcherAuthorizer()
        
        return calendarService
    }()
    
    // MARK: - Public Methods
    
    func getCalendarList() {
        let query = GTLRCalendarQuery_CalendarListList.query()
        self.service?.executeQuery(query, completionHandler: { (ticket, result, error) in
            print("ticket: \(ticket)")
            if let calendarList = (result as? GTLRCalendar_CalendarList), let items = calendarList.items {
                items.forEach {
                    print("item: \($0)")
                }
            }
            print("error: \(error.debugDescription)")
        })
    }
}
