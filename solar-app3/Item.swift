//
//  Item.swift
//  solar-app3
//
//  Created by 张振澜 on 2025/3/21.
//

import Foundation
import SwiftData

@Model
final class SolarTerm {
    var name: String
    var englishName: String
    var date: Date
    var termDescription: String
    var farmingActivities: String
    var climaticFeatures: String
    var folkCustoms: String
    var poetry: String
    var backgroundImageName: String
    var seasonColor: String
    
    init(name: String, englishName: String, date: Date, termDescription: String, farmingActivities: String, climaticFeatures: String, folkCustoms: String, poetry: String, backgroundImageName: String, seasonColor: String) {
        self.name = name
        self.englishName = englishName
        self.date = date
        self.termDescription = termDescription
        self.farmingActivities = farmingActivities
        self.climaticFeatures = climaticFeatures
        self.folkCustoms = folkCustoms
        self.poetry = poetry
        self.backgroundImageName = backgroundImageName
        self.seasonColor = seasonColor
    }
}
