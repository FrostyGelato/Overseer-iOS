//
//  SettingsManager.swift
//  Overseer
//
//  Created by Joshua Fan on 26/03/2021.
//  Copyright © 2021 joshuafan. All rights reserved.
//

import Foundation

struct SettingsManager {
    
    let defaults = UserDefaults.standard
    
    func setDefaults() {
        defaults.setValue(25, forKey: "breakLength")
        defaults.setValue(5, forKey: "workLength")
    }
    
    func getWorkPeriodLength() -> Int {
        return defaults.integer(forKey: "workLength")
    }
    
    func getBreakPeriodLength() -> Int {
        return defaults.integer(forKey: "breakLength")
    }
}
