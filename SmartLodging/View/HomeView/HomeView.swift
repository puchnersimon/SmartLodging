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
                    WeatherView()
                   // Text("Weather View")
                    FrontDoorView()
                    HeatingPlugView()
                    saveEnergyCell()
                    LightsView()
                    heatingCell()
                    routineCell()
                    wakeUpRoutineCell()
                }.scrollContentBackground(.hidden)
            }
            .background(
                Image("Background_HomeView")
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height) // full screen
                    .scaledToFill()
                    .opacity(0.3)
            )
            .padding()
            .navigationTitle("Home")
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

/*
struct FrontDoorView: View{
    @State var locked = true
    @State var loaded = false
    @State var lockedOpacity = 1.0
    @State var unlockedOpacity = 0.3
    @State private var showingAlert = false
    
    
    var body: some View{
        HStack{
            if loaded{
                Text("Front door:")
                    .font(.system(size: 20))
                    .bold()
                    .underline()
                    .padding()
                
                if locked{
                    
                    Button(action:{
                    },label:{
                        Image("doorLocked")
                            .resizable()
                            .scaledToFit()
                            .opacity(1.0)
                        
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
                            .opacity(0.3)
                        
                    })
                    .buttonStyle(BorderlessButtonStyle())
                    .alert(isPresented: $showingAlert) {
                        Alert(
                            title: Text("Are you sure you want to open the door?"),
                            primaryButton: .default(Text("Open")) {
                                print("Open Door...")
                                changePlugState(toState: "ON")
                            },
                            secondaryButton: .cancel()
                        )
                    }
                    
                }else{
                    Button(action:{
                        changePlugState(toState: "OFF")
                    },label:{
                        Image("doorLocked")
                            .resizable()
                            .scaledToFit()
                            .opacity(0.3)
                        
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
                            .opacity(1.0)
                        
                    })
                    .buttonStyle(BorderlessButtonStyle())
                    .alert(isPresented: $showingAlert) {
                        Alert(
                            title: Text("Are you sure you want to open the door?"),
                            primaryButton: .default(Text("Open")) {
                                print("Open Door...")
                                changePlugState(toState: "ON")

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
            self.getPlugState()            }
        
    }
    
    
    func getPlugState(){
        guard let url = URL(string: "http://smartlodging.ddns.net:8080/rest/items/SmartLodging_Plug_1")else{
            return
        }
        let task = URLSession.shared.dataTask(with: url){ data, response, error in
            let decoder = JSONDecoder()
            
            if let data = data{
                do {
                    let plug1 = try decoder.decode(Plug.self, from: data)
                    if(plug1.state == "OFF"){
                        locked = true
                    }else if(plug1.state == "ON"){
                        locked = false
                    }
                    print("Plug State: \(plug1.state)")
                    loaded = true
                }catch{
                    print(error)
                }
            }
        }
        task.resume()
        
    }
    
    func changePlugState(toState: String){
        // create the url with URL
        let url = URL(string: "http://smartlodging.ddns.net:8080/rest/items/SmartLodging_Plug_1")!
   
        var request = URLRequest(url: url)
        request.setValue("text/plain", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")

        request.httpMethod = "POST"
        let postString = toState
        request.httpBody = postString.data(using: .utf8)
        
        // Getting response for POST Method
        DispatchQueue.main.async {
            let task = URLSession.shared.dataTask(with: request) { data, response, error in
                guard let data = data, error == nil else {
                    return // check for fundamental networking error
                }
                locked.toggle()
            }
            task.resume()
        }
    }
}
*/
/*
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
}*/
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

