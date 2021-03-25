//
//  PastPeriodDBManager.swift
//  Overseer
//
//  Created by Joshua Fan on 25/03/2021.
//  Copyright © 2021 joshuafan. All rights reserved.
//

import Foundation
import SQLite

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
}
