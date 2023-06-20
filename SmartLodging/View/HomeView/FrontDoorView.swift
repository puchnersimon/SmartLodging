//
//  FrontDoorView.swift
//  SmartLodging
//
//  Created by Fabian Hofer on 21.02.23.
//

import Foundation
import SwiftUI

struct FrontDoorView: View{

    @StateObject private var viewModel = ViewModel()
    
    var body: some View{
        HStack{
            
            if viewModel.FrontDoorLoaded{
                Text("Front door:")
                    .font(.system(size: 18))
                    .bold()
                    .underline()
                    .padding()
                
                if viewModel.isFrontDoorClosed{
                    
                    Button(action:{
                    },label:{
                        Image("doorLocked")
                            .resizable()
                            .scaledToFit()
                            .opacity(1.0)
                        
                    })
                    .buttonStyle(BorderlessButtonStyle())
                    
                    Button(action:{
                        if(viewModel.isFrontDoorClosed){
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
                                viewModel.changeLockState(toState: "OFF")
                            },
                            secondaryButton: .cancel()
                        )
                    }
                    
                }else{
                    Button(action:{
                        viewModel.changeLockState(toState: "ON")
                    },label:{
                        Image("doorLocked")
                            .resizable()
                            .scaledToFit()
                            .opacity(0.3)
                        
                    })
                    .buttonStyle(BorderlessButtonStyle())
                    
                    Button(action:{
                        if(viewModel.isFrontDoorClosed){
                            viewModel.showingAlert = true
                        }
                    },label: {
                        Image("doorUnlocked")
                            .resizable()
                            .scaledToFit()
                            .opacity(1.0)
                        
                    })
                    .buttonStyle(BorderlessButtonStyle())
                    
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
            viewModel.getLockState()
            
        }
        
    }
    
}


struct Previews_FrontDoorView_Previews: PreviewProvider {
    static var previews: some View {
FrontDoorView()
        
    }
}
