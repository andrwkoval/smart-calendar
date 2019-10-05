////
////  FrameworkService.swift
////  SmartCalendar
////
////  Created by Yevhenii Orenchuk on 10/5/19.
////  Copyright © 2019 oldschool-ucu-ios. All rights reserved.
////
//
//import UIKit
//import GoogleSignIn
//
//protocol ApplicationServiceProtocol: class, UIWindowSceneDelegate {
//    
//}
//
//class FrameworkService: NSObject {
//    var window: UIWindow?
//}
//
//// MARK: - UIWindowSceneDelegate
//
////extension FrameworkService: ApplicationServiceProtocol {
//    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
//        GIDSignIn.sharedInstance().clientID = "54251599891-pvi21hv87iiqkev1deuaq6v4b792ma7c.apps.googleusercontent.com"
//        GIDSignIn.sharedInstance().scopes = ["https://www.googleapis.com/auth/calendar.readonly"]
//        
//        if GIDSignIn.sharedInstance().hasPreviousSignIn() {
//            GIDSignIn.sharedInstance().restorePreviousSignIn()            
//            RootCoordinator.shared.switch(to: .main, window: self.window)
//        } else {
//            RootCoordinator.shared.switch(to: .auth, window: self.window)
//        }
//    }
//}
