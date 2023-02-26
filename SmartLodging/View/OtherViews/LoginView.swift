//
//  LoginView.swift
//  SmartLodging
//
//  Created by Fabian Hofer on 24.02.23.
//

import SwiftUI

struct LoginView: View {
    @State var name: String = ""
    @State var houseKey: String = ""
    
    var body: some View {
        
        VStack{
            Image("SLLogo")
                .resizable()
                .scaledToFit()
            Text("Login with credentials")
                .font(.system(size: 28))
                .foregroundColor(.white)
            HStack {
                Image(systemName: "person").foregroundColor(.white).padding(20)
                TextField("Username", text: $name)
                    .textFieldStyle(.roundedBorder)
                Spacer(minLength: 25.0)
            }
            .multilineTextAlignment(.center)
            .font(.system(size: 24))
            HStack {
                Image(systemName: "key").foregroundColor(.white).padding(20)
                TextField("House Key", text: $houseKey)
                    .textFieldStyle(.roundedBorder)
                Spacer(minLength: 25.0)
            }
            .multilineTextAlignment(.center)
            .font(.system(size: 24))
            
        }.background(
            Rectangle()
                .fill(Gradient(colors: [.cyan, .purple]))
                .ignoresSafeArea()
                .edgesIgnoringSafeArea(.all)
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                .scaledToFill()
        )
    }
    
    struct LoginView_Previews: PreviewProvider {
        static var previews: some View {
            LoginView()
        }
    }
}
