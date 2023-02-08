//
//  HomeView.swift
//  SmartLodging
//
//  Created by Simon Puchner on 28.09.22.
//

import SwiftUI

struct HomeView: View {
    
    
    
    var body: some View {
        NavigationView {
            VStack{
               
                List {
                    FrontDoorCell()
                    saveEnergyCell()
                    lightCell()
                    heatingCell()
                    routineCell()
                    wakeUpRoutineCell()
                }
                .background(Color.cyan)
                .listStyle(.grouped)
                .navigationTitle("Home")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            //ACTION
                            //TODO - message
                            print("message button was tapped")
                        } label: {
                            Image(systemName: "message")
                        }
                    }
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button {
                            print("menu opens")
                        } label: {
                            Image(systemName: "line.3.horizontal")
                        }
                    }
                }
            }
            
        }
    }
    
    
    
    struct FrontDoorCell: View {
        
        @State private var showingAlert = false
        
        var body: some View {
            VStack (alignment: .center, spacing: 10) {
                HStack {
                    Text("Front door:")
                        .font(.system(size: 20))
                        .bold()
                        .underline()
                        .padding()
                    Spacer()
                    Text("closed")
                        .font(.system(size: 20))
                        .foregroundColor(.green)
                        .padding()
                    
                }
                Button {
                    print("sure to open door?")
                    //Alert
                    showingAlert = true
                } label: {
                    Text("open")
                        .frame(maxWidth: .infinity)
                }
                .alert(isPresented: $showingAlert) {
                    Alert(
                        title: Text("Are you sure you want to open the door?"),
                        primaryButton: .default(Text("Open")) {
                            print("Open Door...")
                        },
                        secondaryButton: .cancel()
                    )
                }
                .buttonStyle(.bordered)
                .padding(.bottom, 20)
            }            .listRowBackground(Color.clear)
            
        }
        
    }
    
    
    
    struct saveEnergyCell: View {
        
        @State var isEnergyModeOn = true
        
        var body: some View {
            HStack (alignment: .center, spacing: 10) {
                Toggle (isOn: $isEnergyModeOn) {
                    Text("Save energy:")
                        .font(.system(size: 20))
                        .bold()
                        .underline()
                }
                .padding()
                
            }
        }
        
    }
    
    struct lightCell: View {
        
        var body: some View {
            
            HStack {
                Text("Light:")
                    .font(.system(size: 20))
                    .bold()
                    .underline()
                    .padding()
                
                Spacer()
                
                HStack {
                    Button {
                        
                    } label: {
                        Text("darker")
                    }
                    .buttonStyle(.bordered)
                    
                    Button {
                        
                    } label: {
                        Text("lighter")
                    }
                    .buttonStyle(.bordered)
                }
                .padding()
            }
        }
        
    }
    
    struct heatingCell: View {
        
        var body: some View {
            
            HStack {
                Text("Heating:")
                    .font(.system(size: 20))
                    .bold()
                    .underline()
                    .padding()
                
                Spacer()
                
                HStack {
                    Button {
                        
                    } label: {
                        Text("colder")
                    }
                    .buttonStyle(.bordered)
                    
                    Button {
                        
                    } label: {
                        Text("warmer")
                    }
                    .buttonStyle(.bordered)
                }
                .padding(.trailing)
                
            }
        }
        
    }
    
    struct routineCell: View {
        
        var body: some View {
            
            HStack {
                Text("Routine:")
                    .font(.system(size: 20))
                    .bold()
                    .underline()
                    .padding()
                
                
                Spacer()
                
                HStack {
                    Button {
                        
                    } label: {
                        Text("morning")
                    }
                    .buttonStyle(.bordered)
                    
                    Button {
                        
                    } label: {
                        Text("evening")
                    }
                    .buttonStyle(.bordered)
                }
                .padding()
            }
        }
        
    }
    
    struct wakeUpRoutineCell: View {
        
        @State var currentDate = Date()
        @State var isWakeUpRoutineOn = false
        
        var body: some View {
            VStack {
                Toggle (isOn: $isWakeUpRoutineOn) {
                    Text("Wake-up routine:")
                        .font(.system(size: 20))
                        .bold()
                        .underline()
                }
                .padding()
                
                if (isWakeUpRoutineOn == true) {
                    DatePicker("", selection: $currentDate, displayedComponents: [.hourAndMinute])
                        .datePickerStyle(WheelDatePickerStyle())
                        .labelsHidden()
                        .padding()
                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
