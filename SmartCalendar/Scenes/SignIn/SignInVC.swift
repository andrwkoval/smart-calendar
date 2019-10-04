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
    @IBOutlet private weak var titleLabel: UILabel!

    // MARK: - ViewController Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        GIDSignIn.sharedInstance().presentingViewController = self
        GIDSignIn.sharedInstance().delegate = self

    }

}

    // MARK: - GoogleSignIn delegate

extension SignInVC: GIDSignInDelegate {
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        if let error = error {
          if (error as NSError).code == GIDSignInErrorCode.hasNoAuthInKeychain.rawValue {
            print("The user has not signed in before or they have since signed out.")
          } else {
            print("\(error.localizedDescription)")
          }
          return
        }
        
        // TODO: - User lives here, save his data
        
        let username = user.profile.name ?? "null"
        
        UserDefaults.standard.set(username, forKey: "user")
        
        RootCoordinator.shared.switch(to: .main)
        
    }
    
}
