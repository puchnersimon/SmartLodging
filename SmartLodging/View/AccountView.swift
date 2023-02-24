//
//  AccountView.swift
//  SmartLodging
//
//  Created by Simon Puchner on 28.09.22.
//

import SwiftUI

struct AccountView: View {
    //Label for accesskey
    @State var accessKey: String = ""
    
    var body: some View {
        NavigationView {
            VStack {
                //Textfield for Accesskey
                TextField("Accesskey ...", text: $accessKey)
                    .padding()
                    .background(Color.gray.opacity(0.3).cornerRadius(10))
                    .font(.headline)
                
                
                Button("add apartment") {
                    //ACTION
                    //TODO - add accesskey and apartment
                }
                .padding()
                .buttonStyle(.bordered)
                
                Spacer().frame(height: 30)
                
                Text("Apartments:").font(.system(size: 15))
                    .foregroundColor(.gray)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Spacer().frame(height: 10)
                
                //NavigationList with the Apartments
                
                List (1..<4) { value in
                    NavigationLink(destination: ApartmentInfo()) {
                        
                        VStack {
                            
                            if value == 1 {
                                Text("Apartment\(value)")
                                    .font(.system(size: 22))
                                    .foregroundColor(.green)
                            } else {
                                Text("Apartment\(value)")
                                    .font(.system(size: 22))
                                    .foregroundColor(.red)
                            }
                            
                            Text("14.07.2022 - 24.07.2022")
                        }
                        .multilineTextAlignment(.center)
                    }
                    
                }.scrollContentBackground(.hidden)
                
                
            }
            .padding()
            .navigationBarTitle("Account")
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
            }
        }
    }
}


struct ApartmentInfo: View {
    
    var body: some View {
        
        VStack {
            Section {
                Text("Bookingname: John Doe")
                    .frame(maxWidth: .infinity, maxHeight: 40)
                    .multilineTextAlignment(.center)
                    .font(.system(size: 25))
                    .padding(.top, 10)
                
                Text("Access from: 14.07.2022, 2:00 PM")
                    .frame(maxWidth: .infinity, maxHeight: 40)
                    .multilineTextAlignment(.center)
                    .font(.system(size: 22))
                
                Text("Access until: 24.07.2022, 10:00 AM")
                    .frame(maxWidth: .infinity, maxHeight: 40)
                    .multilineTextAlignment(.center)
                    .font(.system(size: 22))
                Text("Access: allowed")
                    .font(.title)
                    .foregroundColor(.green)
            }
            
            Spacer()
            
            Section {
                Text("Apartmentinformation:")
                    .font(.title)
                    .underline()
                    .padding(.bottom, 2)
                Text("Apartment")
                    .padding(.bottom, 2)
                Text("Adress: pattern street 1, 12345")
                    .padding(.bottom, 2)
                Text("Country: model country")
                    .padding(.bottom, 2)
                Text("+43664 123456789")
                    .underline()
                    .foregroundColor(.blue)
                    .padding(.bottom, 10)
            }
            
            
        }
        
    }
    
}


struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}
