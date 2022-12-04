//
//  OrderView.swift
//  SmartLodging
//
//  Created by Simon Puchner on 28.09.22.
//

import SwiftUI

struct OrderView: View {
    
    //the selected Category - Nutrition/Cleaning
    @State var selectedCategoryOrder = 0
    //is a package expended(dropdown)
    @State var isExpendedPackage1 = false
    @State var isExpendedPackage2 = false
    //Timepicker for CleaningOrder
    @State var currentDate = Date()
    
    let package:[String] = [
        "1x Bread",
        "1x Milk",
        "10dag Ham",
        "10dag Cheese",
        "6x Egg",
        "1x sweet Pepper"
    ]
    
    var body: some View {
        NavigationView {
            VStack {
                //Picker for Selected Category
                Picker("SelectedCategoryOrder", selection: $selectedCategoryOrder) {
                    Text("Nutrition").tag(0)
                        .padding()
                    Text("Cleaning").tag(1)
                        .padding()
                }
                .padding()
                .pickerStyle(.segmented)
                
                
                ScrollView {
                    if (selectedCategoryOrder == 0) {
                        //Packages
                        Text("Package:").font(.system(size: 12))
                            .padding()
                            .foregroundColor(.gray)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        //Nutrition Packages
                        //Package1 - Breakfast1
                        DisclosureGroup("Breakfast1", isExpanded: $isExpendedPackage1) {
                            VStack (alignment: .leading){
                                ForEach (package, id: \.self) { detail in
                                    Text("Detail: \(detail)")
                                        .foregroundColor(.gray)
                                        .padding(.bottom, 5)
                                }
                                
                                Text("Cost: 15,00 €")
                                    .font(.title)
                                    .bold()
                                
                                Spacer().frame(height: 30)
                                
                                Button("order") {
                                    //ACTION
                                    //TODO - accept order
                                }
                                .padding()
                                .frame(maxWidth: .infinity)
                                .border(.blue)
                                Text("Your package will be delievered on the next day at 8:00 AM!")
                                    .foregroundColor(.gray)
                                    .multilineTextAlignment(.center)
                            }
                        }
                        .padding()
                        .border(.blue)
                        
                        
                        
                        //Package2 - Breakfast2
                        DisclosureGroup("Breakfast2", isExpanded: $isExpendedPackage2) {
                            VStack (alignment: .leading) {
                                ForEach (package, id: \.self) { detail in
                                    Text("\(detail)")
                                        .foregroundColor(.gray)
                                        .padding(.bottom, 5)
                                }
                                Text("Cost: 12,00 €")
                                    .font(.title)
                                    .bold()
                                
                                
                                
                                Spacer().frame(height: 30)
                                
                                Button("order") {
                                    //ACTION
                                    //TODO - accept order
                                }
                                .padding()
                                .frame(maxWidth: .infinity)
                                .border(.blue)
                                Text("Your package will be delievered on the next day at 8:00 AM!")
                                    .foregroundColor(.gray)
                                    .multilineTextAlignment(.center)
                            }
                        }
                        .padding()
                        .border(.blue)
                        
                        
                        
                    } else {
                        //Packages
                        //                        Text("Full house cleaning:").font(.system(size: 12))
                        //                            .padding()
                        //                            .foregroundColor(.gray)
                        //                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        //Cleaning Packages
                        //set Date/Time for cleaning
                        VStack {
                            DatePicker("", selection: $currentDate, displayedComponents: [.date, .hourAndMinute])
                                .datePickerStyle(WheelDatePickerStyle())
                                .labelsHidden()
                                .padding(.bottom, 40)
                            
                            Spacer()
                            
                            Button("Order") {
                                //ACTION
                                //TODO - accept order for cleaning
                            }
                            .padding()
                            .frame(maxWidth: .infinity)
                            .border(.blue)
                            
                            Text("Your will get a message if someone is ready for the service!")
                                .foregroundColor(.gray)
                                .multilineTextAlignment(.center)
                                .padding()
                            
                        }
                    }
                }
                Spacer()
            }
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
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView()
    }
}
