//
//  HeatingView.swift
//  SmartLodging
//
//  Created by Fabian Hofer on 17.03.23.
//

import SwiftUI

struct PanelView: View{
    @State private var sliderValue: Double
    private var name: String
    
    init(sliderValue: Double, name: String) {
        self.sliderValue = sliderValue
        self.name = name
    }
    
    var body: some View{
        VStack {
            Text("\(name) Panel")
                .font(.system(size: 18, weight: .bold, design: .monospaced))
            HStack{
                Image(systemName: "thermometer.snowflake")
                    .font(.system(size: 25))
                    .symbolRenderingMode(.hierarchical)
                    .foregroundColor(.cyan)
                Slider(value: $sliderValue, in: 16...26, step: 0.1)
                Image(systemName: "thermometer.sun")
                    .font(.system(size: 25))
                    .symbolRenderingMode(.hierarchical)
                    .foregroundColor(.orange)
            }
            HStack{
                Text(String(format: "%.1f°C", sliderValue))
                    .padding()
                Button(action: {
                    
                }) {
                    Text("Update")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(3)
                }
            }
        }
        .padding(.bottom, 30)
    }
}

struct HeatingView: View {
    
    @StateObject private var viewModel = ViewModel()
    @State private var sliderValue: Double = 22.0
    
    var body: some View {

        VStack{
            DisclosureGroup("Heating") {
                VStack {
                    Text("Workplace Panel")
                        .font(.system(size: 18, weight: .bold, design: .monospaced))
                        .padding(.top, 20) // Add padding on top of the Text view
                    HStack {
                        Image(systemName: "thermometer.snowflake")
                            .font(.system(size: 25))
                            .symbolRenderingMode(.hierarchical)
                            .foregroundColor(.cyan)
                        Slider(value: $sliderValue, in: 16...26, step: 0.1)
                        Image(systemName: "thermometer.sun")
                            .font(.system(size: 25))
                            .symbolRenderingMode(.hierarchical)
                            .foregroundColor(.orange)
                    }
                    HStack {
                        Text(String(format: "%.1f°C", sliderValue))
                            .padding()
                        Button(action: {
                            viewModel.updateTargetTemp(temperature: sliderValue)
                        }) {
                            Text("Update")
                                .padding()
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .cornerRadius(3)
                        }
                    }
                }
                .padding(.top, 10) // Add padding on top of the VStack
                .padding(.bottom, 30)
                PanelView(sliderValue: 21.3, name: "Kitchen")
                PanelView(sliderValue: 22.1, name: "Bedroom")
                PanelView(sliderValue: 17.0, name: "Corridor")
                PanelView(sliderValue: 22.0, name: "Bath")
            }

        }
        .padding()
        .border(.blue)
        .onAppear{
            sliderValue = viewModel.getTargetTemp()
        }
    }
}



struct HeatingView_Previews: PreviewProvider {
    static var previews: some View {
        HeatingView()
    }
}
