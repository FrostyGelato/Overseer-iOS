//
//  DBManager.swift
//  Overseer
//
//  Created by Joshua Fan on 12/9/20.
//  Copyright © 2020 joshuafan. All rights reserved.
//

import Foundation
import SQLite

// superclass for PeriodDBManager and TaskDBManager
class DBManager {
    
    // uses URLs
    /*var DBPath: String?
    
    func DBManager() {
        let directoryURL = try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
        
        DBPath = directoryURL?.appendingPathComponent("db.sqlite3").relativePath
    }*/
    
    // get path for DB
    let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
    
    var db:Connection?
    
    func createDB() {
        
        do {
            db = try Connection("\(path)/db.sqlite3")
            
            // uses URLs and is preferred by Apple
            //let db = try Connection(DBPath!)
        } catch {
            print("Failed to create database: \(error)")
        }
        
        // for manually viewing database
        //print(path)
    }
}
