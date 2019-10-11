//
//  FindIntersection.swift
//  SmartCalendar
//
//  Created by Andriy on 10/5/19.
//  Copyright © 2019 oldschool-ucu-ios. All rights reserved.
//

import Foundation
import GoogleAPIClientForREST

final class FindIntersection {
    
    func findIntersection(first: DateInterval, second: DateInterval) -> DateInterval? {
        return first.intersection(with: second)
    }
    
    func findFreeIntervals(first: [DateInterval],
                           second: [DateInterval]) -> [DateInterval] {
        var intervals = [DateInterval]()
        
        for eventOne in 0..<first.count {
            for eventTwo in eventOne..<second.count {
                if first[eventOne].intersects(second[eventTwo]) {
                    continue
                }
                intervals.append(first[eventOne])
                intervals.append(second[eventTwo])
            }
        }
        
        return intervals
    }
    
}
