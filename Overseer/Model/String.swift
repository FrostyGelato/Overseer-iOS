//
//  String.swift
//  Overseer
//
//  Created by Joshua Fan on 12/9/20.
//  Copyright © 2020 joshuafan. All rights reserved.
//

import Foundation

extension String {
    func convertToTimeInterval() -> TimeInterval {
        guard self != "" else {
            return 0
        }

        var interval:Double = 0

        let parts = self.components(separatedBy: ":")
        for (index, part) in parts.reversed().enumerated() {
            interval += (Double(part) ?? 0) * pow(Double(60), Double(index))
        }

        return interval
    }
}
