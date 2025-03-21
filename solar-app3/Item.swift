//
//  Item.swift
//  solar-app3
//
//  Created by 张振澜 on 2025/3/21.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
