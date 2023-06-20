//
//  HomeViewModel.swift
//  SmartLodging
//
//  Created by Fabian Hofer on 21.02.23.
//

import Foundation

@MainActor class ViewModel: ObservableObject{
    @Published var isPlugOn = true
    @Published var isFrontDoorClosed = true
    @Published var loaded = false
    @Published var FrontDoorLoaded = false
    @Published var showingAlert = false
    @Published var targetTemp = 22.0
    
    
    func getPlugState() {
        let token = "oh.smartlodgingaccesstoken.9AQfKvPm0lYEgZJlQQFHACgOGI1ei2AMwMEU5X45zgLfTEkjGIs9tsM9NoBYew0EN56n1yzN1BIHR2y08A"
        let url = URL(string: "http://smartlodging.ddns.net:8080/rest/items/SmartLodging_Plug_1")!
        
        var request = URLRequest(url: url)
        
        request.httpMethod = "GET"
        request.addValue("Bearer " + token, forHTTPHeaderField: "Authorization")
        
        
        
        let task = URLSession.shared.dataTask(with: request){ data, response, error in
            let decoder = JSONDecoder()
            DispatchQueue.main.async {
                if let data = data{
                    do {
                        let plug1 = try decoder.decode(Plug.self, from: data)
                        if(plug1.state == "OFF"){
                            self.isPlugOn = false
                        }else if(plug1.state == "ON"){
                            self.isPlugOn = true
                        }
                        print("Plug State: \(plug1.state)")
                        self.loaded = true
                    }catch{
                        print(error)
                    }
                }
            }
        }
        task.resume()
    }
    
    
    func changePlugState(toState: String){
        let token = "oh.smartlodgingaccesstoken.9AQfKvPm0lYEgZJlQQFHACgOGI1ei2AMwMEU5X45zgLfTEkjGIs9tsM9NoBYew0EN56n1yzN1BIHR2y08A"
        
        // create the url with URL
        let url = URL(string: "http://smartlodging.ddns.net:8080/rest/items/SmartLodging_Plug_1")!
        
        var request = URLRequest(url: url)
        request.setValue("text/plain", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        
        request.httpMethod = "POST"
        request.addValue("Bearer " + token, forHTTPHeaderField: "Authorization")
        let postString = toState
        request.httpBody = postString.data(using: .utf8)
        
        // Getting response for POST Method
        DispatchQueue.main.async {
            let task = URLSession.shared.dataTask(with: request) { data, response, error in
                guard let data = data, error == nil else {
                    return // check for fundamental networking error
                }
                
            }
            //   self.isPlugOn.toggle()
            task.resume()
        }
    }
    
    
    // ---------- SmartLock ------------
    
    
    func getLockState() {
        let token = "oh.smartlodgingaccesstoken.9AQfKvPm0lYEgZJlQQFHACgOGI1ei2AMwMEU5X45zgLfTEkjGIs9tsM9NoBYew0EN56n1yzN1BIHR2y08A"
        let url = URL(string: "http://smartlodging.ddns.net:8080/rest/items/Nuki_Aktion")!
        
        var request = URLRequest(url: url)
        
        request.httpMethod = "GET"
        request.addValue("Bearer " + token, forHTTPHeaderField: "Authorization")
        
        
        
        let task = URLSession.shared.dataTask(with: request){ data, response, error in
            let decoder = JSONDecoder()
            DispatchQueue.main.async {
                if let data = data{
                    do {
                        let lock = try decoder.decode(Plug.self, from: data)
                        if(lock.state == "OFF"){
                            self.isFrontDoorClosed = false
                        }else if(lock.state == "ON"){
                            self.isFrontDoorClosed = true
                        }
                        print("Lock State: \(lock.state)")
                        self.FrontDoorLoaded = true
                    }catch{
                        print(error)
                    }
                }
            }
        }
        task.resume()
        
    }
    
    
    func changeLockState(toState: String){
        let token = "oh.smartlodgingaccesstoken.9AQfKvPm0lYEgZJlQQFHACgOGI1ei2AMwMEU5X45zgLfTEkjGIs9tsM9NoBYew0EN56n1yzN1BIHR2y08A"
        
        // create the url with URL
        let url = URL(string: "http://smartlodging.ddns.net:8080/rest/items/Nuki_Aktion")!
        
        var request = URLRequest(url: url)
        request.setValue("text/plain", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        
        request.httpMethod = "POST"
        request.addValue("Bearer " + token, forHTTPHeaderField: "Authorization")
        let postString = toState
        request.httpBody = postString.data(using: .utf8)
        
        // Getting response for POST Method
        DispatchQueue.main.async {
            let task = URLSession.shared.dataTask(with: request) { data, response, error in
                guard let data = data, error == nil else {
                    return // check for fundamental networking error
                }
                
            }
            self.isFrontDoorClosed.toggle()
            task.resume()
        }
    }
    
    
    // ---------- Panel(s) ------------
    
    
    @Published var currentTemperature : Double = 18.5
    func getTargetTemperature(){
        let token = "oh.irtoken.1x56tnr0h34oUzQWCfMenCTrb2IOfpz6dgDIx68XJgPlrv3PIVQfvkjR6VPajOMwxYzx4HxuDXrGZvKvsUQ"
        let url = URL(string: "http://localhost:8080/rest/items/IR_Target_Temp")!
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue("Bearer " + token, forHTTPHeaderField: "Authorization")
        
        let task = URLSession.shared.dataTask(with: request){ data, response, error in
            let decoder = JSONDecoder()
            DispatchQueue.main.async {
                if let data = data{
                    do {
                        let temp = try decoder.decode(Temp.self, from: data)
                        if let temperature = Double(temp.state){
                            self.targetTemp = temperature
                        }
                    }catch{
                        print(error)
                    }
                }
            }
        }
        task.resume()
    }
    
    func updateTargetTemp(temperature: Double){
        let token = "oh.irtoken.1x56tnr0h34oUzQWCfMenCTrb2IOfpz6" +
        "dgDIx68XJgPlrv3PIVQfvkjR6VPajOMwxYzx4HxuDXrGZvKvsUQ"
        let url = URL(string: "http://localhost:8080" +
                      "/rest/items/IR_Target_Temp")!
        
        var request = URLRequest(url: url)
        request.setValue("text/plain",
                         forHTTPHeaderField: "Content-Type")
        request.setValue("application/json",
                         forHTTPHeaderField: "Accept")
        
        request.httpMethod = "POST"
        request.addValue("Bearer " + token,
                         forHTTPHeaderField: "Authorization")
        let postString = "\(temperature)"
        request.httpBody = postString.data(using: .utf8)

        // POST Method
        let task = URLSession.shared.dataTask(with:
                                                request) { data, response, error in
            DispatchQueue.main.async {
                
                guard let data = data, error == nil else {
                    print(error)
                    return
                }
                self.targetTemp = temperature
            }

        }
        task.resume()
    }
    
    @Published var isOn: Bool = false
    private var count = 1
    
    
    
    func updateControlValue(val: Double) {
        DispatchQueue.global(qos: .background).async {
            DispatchQueue.main.async {
            }
        }
    }
    
    func togglePanel() {
        DispatchQueue.global(qos: .background).async {
            DispatchQueue.main.async {
                self.isOn.toggle()
            }
        }
    }
    
    func getTargetTemp() -> Double{
        getTargetTemperature()
        return self.targetTemp
    }
    func getCurrentTemp() -> Double{
        return self.currentTemperature
    }
    
    
    
}
