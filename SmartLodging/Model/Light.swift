//
//  Light.swift
//  SmartLodging
//
//  Created by Simon Puchner on 05.12.22.
//

import Foundation

struct RoomLight: Identifiable{
    var id = UUID()
    var name: String
    var brightness: Double? = 50.0
    mutating func setBrightness(newVal: Double) {
        brightness = newVal
    }
    func getBrightness() -> Double {
        brightness == nil ? 0.0 : brightness!
    }
}
struct LightGroup: Identifiable{
    var id = UUID()
    var name: String
    var lights : [RoomLight]
}

