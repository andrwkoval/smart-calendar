//
//  RootCoordinator.swift
//  SmartCalendar
//
//  Created by Yevhenii Orenchuk on 10/3/19.
//  Copyright © 2019 oldschool-ucu-ios. All rights reserved.
//

import UIKit

enum AppScreen {
    case auth
    case main
}

final class RootCoordinator {
    
    // MARK: - Properties
    
    static let shared = RootCoordinator()
    
    // MARK: - Public methods
    
    func `switch`(to screen: AppScreen, window: UIWindow? = UIApplication.shared.windows.filter({$0.isKeyWindow}).first) {
        
        guard let window = window else { return }
    
        switch screen {
        case .main:
            let mainVC = R.storyboard.main().instantiateInitialViewController() as? MainVC
            window.rootViewController = mainVC
        default:
            break
        }
        
    }
}
