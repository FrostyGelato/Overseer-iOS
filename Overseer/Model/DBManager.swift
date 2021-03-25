//
//  DBManager.swift
//  Overseer
//
//  Created by Joshua Fan on 12/9/20.
//  Copyright © 2020 joshuafan. All rights reserved.
//

import Foundation
import SQLite

// Superclass for PeriodDBManager and TaskDBManager
class DBManager {
    
    // uses URLs
    /*var DBPath: String?
    
    func DBManager() {
        let directoryURL = try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
        
        DBPath = directoryURL?.appendingPathComponent("db.sqlite3").relativePath
    }*/
    
    // DB's path
    let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
    
    var db:Connection?
    
    // Creates database
    func createDB() {
        
        do {
            db = try Connection("\(path)/db.sqlite3")
            
            // Uses URLs and is preferred by Apple
            //let db = try Connection(DBPath!)
            
        } catch {
            print("Failed to create database: \(error)")
        }
        
        // Prints DB's path
        //print(path)
    }
}
