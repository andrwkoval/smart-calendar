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
    
    func getCalendarList(completion: @escaping ([GTLRCalendar_CalendarListEntry]?, Error?) -> Void) {
        let query = GTLRCalendarQuery_CalendarListList.query()
        self.service?.executeQuery(query, completionHandler: { (ticket, result, error) in
            print("ticket: \(ticket)")
            if let calendarList = (result as? GTLRCalendar_CalendarList), let items = calendarList.items {
                items.forEach {
                    print("item: \($0)")
                }
                
                completion(items, nil)
            } else {
                print("error: \(error.debugDescription)")
                completion(nil, error)
            }
        })
    }
    
    func getEvents(id calendarId: String,
                   startDate: Date = Date(),
                   endDate: Date = Date().addingTimeInterval(60*60*24),
                   completion: @escaping ([GTLRCalendar_Event]?, Error?) -> Void) {
        
        // You can pass start and end dates with function parameters
        let startDateTime = GTLRDateTime(date: Calendar.current.startOfDay(for: startDate))
        let endDateTime = GTLRDateTime(date: endDate)
        
        let query = GTLRCalendarQuery_EventsList.query(withCalendarId: calendarId)
        query.timeMin = startDateTime
        query.timeMax = endDateTime
        
        self.service?.executeQuery(query, completionHandler: { (ticket, result, error) in
            print("ticket: \(ticket)")
            if let events = result as? GTLRCalendar_Events, let items = events.items {
                items.forEach {
                    print("event: \($0)")
                }
                
                completion(items, nil)
            } else {
                print("error: \(error.debugDescription)")
                completion(nil, error)
            }
        })
    }
}
