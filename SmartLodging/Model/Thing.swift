//
//  Thing.swift
//  SmartLodging
//
//  Created by Simon Puchner on 05.12.22.
//

import Foundation

class Thing: ObservableObject {
    
    @Published var systemID: Int
    //var room: Room?
    @Published var isControllable: Bool

    init(systemID: Int, isControllable: Bool) {
        self.systemID = systemID
        //self.room = room
        self.isControllable = isControllable
    }
    
}
