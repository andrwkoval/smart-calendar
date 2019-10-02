//
//  SignInVC.swift
//  SmartCalendar
//
//  Created by Yevhenii Orenchuk on 10/2/19.
//  Copyright © 2019 oldschool-ucu-ios. All rights reserved.
//

import UIKit
import GoogleSignIn

final class SignInVC: UIViewController {

    // MARK: - IBOutlets

    @IBOutlet private weak var signInButton: GIDSignInButton!

    // MARK: - ViewController Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        GIDSignIn.sharedInstance()?.presentingViewController = self

        // Automatically sign in the user.
        GIDSignIn.sharedInstance()?.restorePreviousSignIn()

    }

}
