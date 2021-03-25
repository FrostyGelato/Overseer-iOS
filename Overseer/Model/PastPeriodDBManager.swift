//
//  PastPeriodDBManager.swift
//  Overseer
//
//  Created by Joshua Fan on 25/03/2021.
//  Copyright © 2021 joshuafan. All rights reserved.
//

/*import Foundation
import SQLite

// controls past sessions
class PastPeriodDBManager: DBManager {
    
    // set columns
    let id = Expression<Int64>("id")
    let name = Expression<String>("name")
    let date = Expression<String>("date")
    let start = Expression<String>("starttime")
    let end = Expression<String>("endtime")
    
    // set table
    let pastPeriods = Table("pastPeriods")
    
    func createPastPeriodTable() {
        
        // create table
        do {
            try db!.run(pastPeriods.create(ifNotExists: true) { t in
                t.column(id, primaryKey: .autoincrement)
                t.column(name, unique: true)
                t.column(date)
                t.column(start)
                t.column(end)
            })
        } catch {
            print("Failed to create pastPeriod table: \(error)")
        }
    }
    
    func addPastPeriod(_ periodName: String, _ periodDate: String, _ startTime: String, _ endTime: String) {
        
        do {
            try db!.run(periods.insert(name <- periodName, date <- periodDate, start <- startTime, end <- endTime))
        } catch {
            print("Failed to add past period: \(error)")
        }
    }
    
    func getPastPeriods() -> [Period] {
        
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
    
    func deletePastPeriod(_ idForPeriod: Int64) {
        
        // filters rows
        let periodToBeDeleted = pastPeriods.filter(id == idForPeriod)
        
        do {
            try db!.run(periodToBeDeleted.delete())
        } catch {
            print("Failed to delete row: \(error)")
        }
        
    }
    
    // will be used in settings for reset
    func deleteAllPastPeriods() {
        
        do {
            try db!.run(pastPeriods.delete())
        } catch {
            print("Failed to clear periods: \(error)")
        }
    }
}*/
