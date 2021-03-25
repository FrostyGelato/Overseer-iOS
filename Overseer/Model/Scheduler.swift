//
//  Scheduler.swift
//  Overseer
//
//  Created by Joshua Fan on 25/03/2021.
//  Copyright © 2021 joshuafan. All rights reserved.
//

import Foundation

struct Schedulor {
    
    //needs to be fetched from preferences
    var workPeriodLength: Double = 1800
    
    func add(name: String, lengthRequired: TimeInterval) {
        
        //calculate how many periods needed for task
        var numberOfPeriods = lengthRequired/workPeriodLength
        
        //round up to whole number
        numberOfPeriods.round(.up)
    }
    
    //add all sessions after the last period
}
