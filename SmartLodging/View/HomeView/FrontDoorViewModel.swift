//
//  HomeViewModel.swift
//  SmartLodging
//
//  Created by Fabian Hofer on 21.02.23.
//

import Foundation

@MainActor class FrontDoorViewModel: ObservableObject{
    @Published var locked = true
    @Published var loaded = false
    @Published var showingAlert = false
    
    
    /*
    func getPlugState(){
        guard let url = URL(string: "http://smartlodging.ddns.net:8080/rest/items/SmartLodging_Plug_1")else{
            return
        }
        let task = URLSession.shared.dataTask(with: url){ data, response, error in
            let decoder = JSONDecoder()
            DispatchQueue.main.async {
                if let data = data{
                    do {
                        let plug1 = try decoder.decode(Plug.self, from: data)
                        if(plug1.state == "OFF"){
                            self.locked = true
                        }else if(plug1.state == "ON"){
                            self.locked = false
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
     */
    
    
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
                            self.locked = true
                        }else if(plug1.state == "ON"){
                            self.locked = false
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
            self.locked.toggle()
            task.resume()
        }
    }
}
