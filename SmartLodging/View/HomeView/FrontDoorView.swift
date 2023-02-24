//
//  FrontDoorView.swift
//  SmartLodging
//
//  Created by Fabian Hofer on 21.02.23.
//

import Foundation
import SwiftUI

struct FrontDoorView: View{

    @StateObject private var viewModel = FrontDoorViewModel()
    
    var body: some View{
        HStack{
            
            if viewModel.loaded{
                Text("Front door:")
                    .font(.system(size: 18))
                    .bold()
                    .underline()
                    .padding()
                
                if viewModel.locked{
                    
                    Button(action:{
                    },label:{
                        Image("doorLocked")
                            .resizable()
                            .scaledToFit()
                            .opacity(1.0)
                        
                    })
                    .buttonStyle(BorderlessButtonStyle())
                    
                    Button(action:{
                        if(viewModel.locked){
                            viewModel.showingAlert = true
                        }
                    },label: {
                        Image("doorUnlocked")
                            .resizable()
                            .scaledToFit()
                            .opacity(0.3)
                        
                    })
                    .buttonStyle(BorderlessButtonStyle())
                    .alert(isPresented: $viewModel.showingAlert) {
                        Alert(
                            title: Text("Are you sure you want to open the door?"),
                            primaryButton: .default(Text("Open")) {
                                print("Open Door...")
                                viewModel.changePlugState(toState: "ON")
                            },
                            secondaryButton: .cancel()
                        )
                    }
                    
                }else{
                    Button(action:{
                        viewModel.changePlugState(toState: "OFF")
                    },label:{
                        Image("doorLocked")
                            .resizable()
                            .scaledToFit()
                            .opacity(0.3)
                        
                    })
                    .buttonStyle(BorderlessButtonStyle())
                    
                    Button(action:{
                        if(viewModel.locked){
                            viewModel.showingAlert = true
                        }
                    },label: {
                        Image("doorUnlocked")
                            .resizable()
                            .scaledToFit()
                            .opacity(1.0)
                        
                    })
                    .buttonStyle(BorderlessButtonStyle())
                    .alert(isPresented: $viewModel.showingAlert) {
                        Alert(
                            title: Text("Are you sure you want to open the door?"),
                            primaryButton: .default(Text("Open")) {
                                print("Open Door...")
                                viewModel.changePlugState(toState: "ON")

                            },
                            secondaryButton: .cancel()
                        )
                    }
                }
            }else{
                HStack{
                    Text("Checking front door state")
                        .foregroundColor(.gray)
                    Spacer()
                    ProgressView()
                }
            }
        }.onAppear() {
            viewModel.getPlugState()            }
        
    }
    
}

