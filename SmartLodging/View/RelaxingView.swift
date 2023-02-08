//
//  SportsView.swift
//  SmartLodging
//
//  Created by Fabian Hofer on 08.02.23.
//

import SwiftUI

struct Event: Identifiable{
    var id = UUID()
    var name: String
    var imgString: String
    var adress: String
    var costs: String
}
struct EventView: View{
    var event: Event
    var body: some View{
        DisclosureGroup(event.name){
            Image(event.imgString)
                .resizable()
                .scaledToFit()
            Text("Address: ")
                .font(.headline)
            + Text("\(event.adress)")
            Text("Entrance: ")
                .font(.headline)
            + Text("\(event.costs)")
        }   .padding()
            .border(.blue)
            .background(.clear)
    }
}

struct RelaxingView: View {
    
    
    let events = [Event(name: "Hyde Park", imgString:  "hydepark",adress: "Hyde Park Pl, London W2, UK, Vereinigtes Königreich", costs: "free"), Event(name: "Spa & Massage Center", imgString: "wellness", adress: "London SW11 4NJ, Vereinigtes Königreich", costs: "25 £")]
    
    var body: some View {
        NavigationStack {
            VStack{
                Text("Lol")

                ForEach(events) { event in
                    EventView(event: event)
                }
            }
            .background(
                Image("LivingRoom")
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                //.frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                    .scaledToFill()
                    .opacity(0.4)
            )
            .padding()
            .navigationTitle("Relaxing Activities")
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
}

struct SportsView_Previews: PreviewProvider {
    static var previews: some View {
        RelaxingView()
    }
}
