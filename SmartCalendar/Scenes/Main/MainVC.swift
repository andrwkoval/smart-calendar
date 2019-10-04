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
        
        let username = UserDefaults.standard.string(forKey: "user")

        self.titleText = username
        
        CalendarService.shared.getCalendarList()

    }

    @IBAction func signOutButton(_ sender: UIButton) {
        GIDSignIn.sharedInstance().signOut()
        
        RootCoordinator.shared.switch(to: .auth)
    }
}
