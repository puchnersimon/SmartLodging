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
                    // WeatherView()
                    Text("Weather View")
                    FrontDoorView()
                    saveEnergyCell()
                    lightsView()
                    heatingCell()
                    routineCell()
                    wakeUpRoutineCell()
                }.listRowBackground(Color.red)
            }
            .background(
                Image("Background_HomeView")
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                //.frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height) // full screen
                    .scaledToFill()
                    .opacity(0.3)
            )
            .padding()
            .navigationTitle("Order")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        //action
                        print("message")
                    } label: {
                        Image(systemName: "message")
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
                
            }.background(.clear)
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
                            .font(.callout)
                    }
                    .buttonStyle(.bordered)
                    
                    Button {
                        
                    } label: {
                        Text("warmer")
                            .font(.callout)
                    }
                    .foregroundColor(.red)
                    .buttonStyle(.bordered)
                }
                //.padding(.trailing)
                
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
                //  .padding()
                
                
                //Spacer()
                
                
                Button {
                    
                } label: {
                    Text("morning")
                }
                .font(.system(size: 14))
                .buttonStyle(.bordered)
                
                Button {
                    
                } label: {
                    Text("evening")
                }
                .buttonStyle(.bordered)
                .font(.system(size: 14))

            }
            .padding()
            
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
                    //                        .padding()
                }
            }
        }
    }
}


struct FrontDoorView: View{
    @State var locked = true
    @State var lockedOpacity = 1.0
    @State var unlockedOpacity = 0.3
    @State private var showingAlert = false
    
    
    var body: some View{
        HStack{
            Text("Tap to un-/lock Front door ")
                .font(.headline)
            Button(action:{
                toggleLock(button: "doorLocked")
            },label:{
                Image("doorLocked")
                    .resizable()
                    .scaledToFit()
                    .opacity(lockedOpacity)
                
            })
            .buttonStyle(BorderlessButtonStyle())
            
            
            Button(action:{
                if(locked){
                    showingAlert = true
                }
            },label: {
                Image("doorUnlocked")
                    .resizable()
                    .scaledToFit()
                    .opacity(unlockedOpacity)
                
            })
            .buttonStyle(BorderlessButtonStyle())
            .alert(isPresented: $showingAlert) {
                Alert(
                    title: Text("Are you sure you want to open the door?"),
                    primaryButton: .default(Text("Open")) {
                        print("Open Door...")
                        toggleLock(button: "doorUnlocked")
                        
                    },
                    secondaryButton: .cancel()
                )
            }
        }
    }
    func toggleLock(button: String){
        if (button == "doorUnlocked" && locked){
            lockedOpacity = 0.3
            unlockedOpacity = 1.0
            locked = false
            /**
             TODO
             unlock door
             */
        }else if (button == "doorLocked" && !locked){
            lockedOpacity = 1.0
            unlockedOpacity = 0.3
            locked = true
        }
    }
}

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

struct lightsView: View{
    
    var lightGroups = [LightGroup(name: "Living Room", lights: [RoomLight(name: "Dining Table Lamp", brightness: 50.0), RoomLight(name: "Corner Lamp", brightness: 30.0)]), LightGroup(name: "Bedroom", lights: [RoomLight(name: "Bedside Lamp left", brightness: 100.0), RoomLight(name: "Bedside Lamp Right", brightness: 100.0)]), LightGroup(name: "Corridor", lights: [RoomLight(name: "Corridor Lights", brightness: 100.0)]), LightGroup(name: "Kitchen", lights: [RoomLight(name: "Kitchen Lamp", brightness: 100.0)]), LightGroup(name: "Bath", lights: [RoomLight(name: "Bath Lights", brightness: 80.0),RoomLight(name: "Shower Lamp", brightness: 10.0)])]
    
    var body: some View{
        Text("Lights:")
            .font(.system(size: 20))
            .bold()
            .underline()
            .padding()
        VStack{
            DisclosureGroup("Available Rooms"){
                ForEach(lightGroups) { group in
                    LightGroupView(lightGroup: group)
                    
                }
            }
            
        } .padding()
            .border(.blue)
    }
}
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

