//
//  Model.swift
//  SmartLodging
//
//  Created by Simon Puchner on 04.12.22.
//

import Foundation

class Door: Thing {
    
    @Published var doorName: String = ""
    @Published var isOpen: Bool = false
    
    init(systemID: Int, isControllable: Bool, doorName: String, isOpen: Bool) {
        super.init(systemID: systemID, isControllable: isControllable)
        self.doorName = doorName
        self.isOpen = isOpen
    }
}
