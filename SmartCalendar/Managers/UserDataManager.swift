//
//  UserDataManager.swift
//  SmartCalendar
//
//  Created by Yevhenii Orenchuk on 10/5/19.
//  Copyright © 2019 oldschool-ucu-ios. All rights reserved.
//

import Foundation
import Locksmith

final class UserDataManager {
    
    // MARK: - Properties
    
    static let shared = UserDataManager()
    
    private let account = "user-account"
    
    // MARK: - User email
    
    func save(email: String) {
        do {
            try Locksmith.saveData(data: ["email": email], forUserAccount: account)
        } catch let error {
            print("🔥 Unable to save email, error: \(error)")
        }
    }
    
    func getEmail() -> String? {
        let data = Locksmith.loadDataForUserAccount(userAccount: account)
        return data?["email"] as? String
    }
    
    func deleteEmail() {
        do {
            try Locksmith.deleteDataForUserAccount(userAccount: account)
        } catch let error {
            print("🔥 Unable to delete email, error: \(error)")
        }
    }
}
