//
//  HeatingPlugView.swift
//  SmartLodging
//
//  Created by Simon Puchner on 24.02.23.
//

import SwiftUI

struct HeatingPlugView: View {
    
    @StateObject private var viewModel = FrontDoorViewModel()
    @State var state = false
    
    var body: some View {
        HStack (alignment: .center, spacing: 10) {
            Toggle (isOn: $state) {
                Text("Plug State:")
                    .font(.system(size: 20))
                    .bold()
                    .underline()
            }
            .onChange(of: state) { value in
                if value == true {
                    viewModel.changePlugState(toState: "ON")
                } else {
                    viewModel.changePlugState(toState: "OFF")
                }
            }
            .padding()
            
        }.onAppear() {
                viewModel.getPlugState()
            }
        .background(.clear)
    }
}

struct HeatingPlugView_Previews: PreviewProvider {
    static var previews: some View {
        HeatingPlugView()
    }
}
