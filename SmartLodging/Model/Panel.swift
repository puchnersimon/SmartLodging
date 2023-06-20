//
//  Panel.swift
//  SmartLodging
//
//  Created by Fabian Hofer on 17.03.23.
//

import Foundation

struct Panel: Identifiable{
    var id = UUID()
    var name: String
    var basicTemperature: Double
    var targetTemperature: Double
    var thermostat: Thermostat
}
