//
//  Light.swift
//  SmartLodging
//
//  Created by Simon Puchner on 05.12.22.
//

import Foundation

class Light: Thing {
    
    @Published var lightName: String = ""
    @Published var isOn: Bool = false
    @Published var dimming: Int = 0
    @Published var temperature: Int = 0
    
    init(systemID: Int, isControllable: Bool, lightname: String, isOn: Bool, dimming: Int, temperature: Int) {
        super.init(systemID: systemID, isControllable: isControllable)
        self.lightName = lightname
        self.isOn = isOn
        self.dimming = dimming
        self.temperature = temperature
    }
    
}
