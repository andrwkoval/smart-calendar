//
//  FindIntersection.swift
//  SmartCalendar
//
//  Created by Andriy on 10/5/19.
//  Copyright © 2019 oldschool-ucu-ios. All rights reserved.
//

import Foundation
import GoogleAPIClientForREST

class FindIntersection {
    
    func findIntersection(first: DateInterval, second: DateInterval) -> DateInterval? {
        return first.intersection(with: second)
    }
    
    func findFreeIntervals(first: [DateInterval],
                           second: [DateInterval]) -> [DateInterval] {
        var intervals = [DateInterval]()
        
        for i in 0..<first.count {
            for j in i..<second.count {
                if first[i].intersects(second[j]) {
                    continue
                }
                intervals.append(first[i])
                intervals.append(second[j])
            }
        }
        
        return intervals
    }
    
}
