//
//  MainVC.swift
//  SmartCalendar
//
//  Created by Yevhenii Orenchuk on 10/3/19.
//  Copyright © 2019 oldschool-ucu-ios. All rights reserved.
//

import UIKit
import GoogleSignIn

final class MainVC: BaseVC {

    var titleText: String? {
        willSet {
            self.titleLabel.text = newValue
        }
    }

    // MARK: - IBOutlets

    @IBOutlet private weak var titleLabel: UILabel!

    // MARK: - ViewController Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let email = UserDataManager.shared.getEmail()

        self.titleText = email
        
        CalendarService.shared.getCalendarList { (_, _) in
 
        }
        
        CalendarService.shared.getEvents(id: "ucu.edu.ua_6uvbqfvjrad83kpvjuvs07b3gk@group.calendar.google.com") { (result, error) in
            result?.forEach {
                print("\($0.start) - \($0.end)")
            }
            
            print(error?.localizedDescription)
        }
        
    }

    @IBAction func signOutButton(_ sender: UIButton) {
        GIDSignIn.sharedInstance().signOut()
        
        RootCoordinator.shared.switch(to: .auth)
    }
}
