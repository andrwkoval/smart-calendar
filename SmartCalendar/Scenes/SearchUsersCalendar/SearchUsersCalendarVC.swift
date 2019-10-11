//
//  SearchUsersCalendarVC.swift
//  SmartCalendar
//
//  Created by Andriy on 10/10/19.
//  Copyright © 2019 oldschool-ucu-ios. All rights reserved.
//

import UIKit
import GoogleAPIClientForREST

class SearchUsersCalendarVC: UITableViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet private weak var searchBar: UISearchBar!
    
    // MARK: - ViewController Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.delegate = self
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        // todo: - implement function
        
        return 0
    }
}

// MARK: - Extensions

extension SearchUsersCalendarVC: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
//        guard let userID = searchBar.text else { return }
//
//        print(userID)
        
        CalendarService.shared.getCalendarList { (resultCalendar, error) in
            resultCalendar?.forEach {
                
                guard let calendarID = $0.identifier else { return }
    
                CalendarService.shared.getEvents(id: calendarID) { (result, error) in
                    result?.forEach {
                        print($0)
                    }
                    
                    print(error?.localizedDescription)
                }
            }
            
        }
        
    }
    
}
