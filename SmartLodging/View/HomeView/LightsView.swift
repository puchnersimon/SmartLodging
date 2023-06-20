//
//  LightsViewModel.swift
//  SmartLodging
//
//  Created by Fabian Hofer on 21.02.23.
//

import Foundation
import SwiftUI

struct LightsView: View{
    
    var lightGroups = [LightGroup(name: "Living Room", lights: [RoomLight(name: "Dining Table Lamp", brightness: 50.0), RoomLight(name: "Corner Lamp", brightness: 30.0)]), LightGroup(name: "Bedroom", lights: [RoomLight(name: "Bedside Lamp left", brightness: 100.0), RoomLight(name: "Bedside Lamp Right", brightness: 100.0)]), LightGroup(name: "Corridor", lights: [RoomLight(name: "Corridor Lights", brightness: 100.0)]), LightGroup(name: "Kitchen", lights: [RoomLight(name: "Kitchen Lamp", brightness: 100.0)]), LightGroup(name: "Bath", lights: [RoomLight(name: "Bath Lights", brightness: 80.0),RoomLight(name: "Shower Lamp", brightness: 10.0)])]
    
    var body: some View{
        VStack{
            DisclosureGroup("Lights"){
                ForEach(lightGroups) { group in
                    LightGroupView(lightGroup: group)
                    
                }
            }
            
        } .padding()
            .border(.blue)
    }
}


struct LightView: View{
    @State var light: RoomLight
    var body: some View{
        Text(light.name)
            .font(.system(size: 18, weight: .bold, design: .monospaced))
        HStack{
            Image(systemName: "sun.min")
                .symbolRenderingMode(.hierarchical)
                .foregroundColor(.yellow)
            Slider(value: Binding(get: {
                light.getBrightness()
            }, set: { value in
                light.setBrightness(newVal: value)
            }), in: 0.0...100.0, step: 1.0)
            .accentColor(.yellow)
            
            Image(systemName: "sun.max")
                .symbolRenderingMode(.hierarchical)
                .foregroundColor(.yellow)
                .bold()
        }
    }
}
struct LightGroupView: View{
    var lightGroup: LightGroup
    @State var value = 0.5
    @State var range = 0.2...0.8
    var body: some View{
        
        Text(lightGroup.name)
            .font(.system(size: 22, weight: .bold, design: .monospaced))
            .underline()
            .padding()
        ForEach(lightGroup.lights, id: \.id){ light in
            LightView(light: light)
        }
        Spacer()
    }
}
