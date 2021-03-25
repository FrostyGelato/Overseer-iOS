//
//  PeriodDBManager.swift
//  Overseer
//
//  Created by Joshua Fan on 12/9/20.
//  Copyright © 2020 joshuafan. All rights reserved.
//

import Foundation
import SQLite

class PeriodDBManager: DBManager {
    
    // set columns
    let id = Expression<Int64>("id")
    let name = Expression<String>("name")
    
    // set table
    let periods = Table("periods")
    
    func createPeriodTable() {
        
        // create table
        do {
            try db!.run(periods.create(ifNotExists: true) { t in
                t.column(id, primaryKey: .autoincrement)
                t.column(name, unique: true)
            })
        } catch {
            print("Failed to create Period table: \(error)")
        }
    }
    
    func addPeriod(_ periodName: String, _ periodDate: String, _ startTime: String, _ endTime: String) {
        
        do {
            try db!.run(periods.insert(name <- periodName, date <- periodDate, start <- startTime, end <- endTime))
        } catch {
            print("Failed to add period: \(error)")
        }
    }
    
    func getPeriods() -> [Period] {
        
        var periodList = [Period]()
        
        do {
            for period in try db!.prepare(periods) {
                
                let period = Period.init(id: period[id], name: period[name], date: period[date], startTime: period[start], endTime: period[end], inThePast: (period[inThePast] != 0))
                
                periodList += [period]
                
                //print("id: \(period[id]), name: \(period[name])")
            }
        } catch {
            print("Failed to get period: \(error)")
        }
        
        return periodList
    }
    
    func deletePeriod(_ idForPeriod: Int64) {
        
        // filters rows
        let periodToBeDeleted = periods.filter(id == idForPeriod)
        
        do {
            try db!.run(periodToBeDeleted.delete())
        } catch {
            print("Failed to delete row: \(error)")
        }
        
    }
    
    // will be used in settings for reset
    func deleteAllPeriods() {
        
        do {
            try db!.run(periods.delete())
        } catch {
            print("Failed to clear periods: \(error)")
        }
    }
}
