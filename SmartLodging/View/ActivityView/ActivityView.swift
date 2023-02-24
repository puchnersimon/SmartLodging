//
//  ActivityView.swift
//  SmartLodging
//
//  Created by Fabian Hofer on 07.02.23.
//

import SwiftUI


struct ButtonView: View {
    let name: String
    let imgString: String
    var body: some View {
        
        Image(imgString)
            .resizable()
            .scaledToFit()
            .overlay(alignment: .bottom, content:
                {
                Text(name)
                    .font(.system(size: 26, weight: .heavy, design: Font.Design.monospaced))
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.orange)
                    .cornerRadius(15)
                    .opacity(0.85)
            })
    }
}
struct ActivityView: View {
    var body: some View {
        NavigationStack{
            VStack{
              
                NavigationLink(destination: RelaxingView()) {
                    ButtonView(name: "Culture", imgString: "culture")
                }.navigationBarTitle(Text("Activities"))
                
                NavigationLink(destination: RelaxingView()) {
                    ButtonView(name: "Events", imgString: "event")
                }.navigationBarTitle(Text("Activities"))
                NavigationLink(destination: RelaxingView()) {
                    ButtonView(name: "Sightseeing", imgString: "sightseeing")
                }.navigationBarTitle(Text("Activities"))
                
                NavigationLink(destination: RelaxingView()) {
                    ButtonView(name: "Relaxing", imgString: "sport4")
                }.navigationBarTitle(Text("Activities"))
                
            }.background(
                Image("LivingRoom")
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                    .scaledToFill()
                    .opacity(0.4)
            )
            .padding()
            .navigationTitle("Activities")
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

struct ActivityView_Previews: PreviewProvider {
    static var previews: some View {
        ActivityView()
    }
}
