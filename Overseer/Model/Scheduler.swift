//
//  Scheduler.swift
//  Overseer
//
//  Created by Joshua Fan on 25/03/2021.
//  Copyright © 2021 joshuafan. All rights reserved.
//

import Foundation

// Schedules periods
struct Scheduler {
    
    // Needs to be fetched from preferences
    var workPeriodLength: Double = 1800
    
    func add(name: String, lengthRequired: TimeInterval) {
        
        // Calculates how many periods needed for task
        var numberOfPeriodsWithDecimal = lengthRequired/workPeriodLength
        
        // Rounds number up to whole number
        numberOfPeriodsWithDecimal.round(.up)
        
        // Number of periods needed for task to be finished
        var numberOfPeriods: Int = Int(numberOfPeriodsWithDecimal)
        
        var periodDBManager = PeriodDBManager()
        
        periodDBManager.createDB()
        periodDBManager.createPeriodTable()
        
        for i in 1...numberOfPeriods {
            
            periodDBManager.addPeriod(name)
        }
    }
}
