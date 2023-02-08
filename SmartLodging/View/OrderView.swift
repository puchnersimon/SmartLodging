//
//  OrderView.swift
//  SmartLodging
//
//  Created by Simon Puchner on 28.09.22.
//

import SwiftUI


struct Package: Identifiable{
    var id = UUID()
    let name: String
    let products: [String]
    let price: Double
}

struct PackageView: View{
    
    var package: Package
    var body: some View{
        
        DisclosureGroup(package.name) {
            VStack (alignment: .leading) {
                ForEach(package.products, id: \.self){ product in
                    Text("\(product)")
                        .foregroundColor(.gray)
                        .padding(.bottom, 5)
                }
                Text("Costs: \(package.price, specifier: "%.2f") €   ")
                    .font(.title)
                    .bold()
                Spacer().frame(height: 30)
                Button("Order") {
                    //ACTION
                    //TODO - accept order
                }
                .bold(true)
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
        .background(.clear)
    }
}


struct OrderView: View {
    
    //the selected Category - Nutrition/Cleaning
    @State var selectedCategoryOrder = 0
    //is a package expended(dropdown)
    @State var isExpendedPackage1 = false
    @State var isExpendedPackage2 = false
    //Timepicker for CleaningOrder
    @State var currentDate = Date()
    @State var background = "breakfast2"
    
    
    let packages = [Package(name: "Happy Morning", products: ["Bread (1 kg)", "Milk (1 l)","Ham (100 g)", "Cheese (100 g)", "Egg (6 pc.)","Sweet Pepper (1 pc.)"], price: 12.50), Package(name: "Bread roll Breakfast", products: ["Bread roll (8 pc.)", "Butter (70 g)","Salami (80 g)","Ham (80 g)","Cheese (80 g)","Apricot jam (35 g)","Nutella (35 g)"], price: 12.00),Package(name: "Athletes' Morning Routine", products: ["Bread roll (4 pc.)", "Banana (3 pc.)", "Yoghurt (300 g)", "Cereals (200 g)", "Ham (50 g)", "Cheese (50 g)"], price: 10.00), Package(name: "Vegan Wake Up", products: ["Waffles (4 pc.) ", "Couscous bowl (1 pc.)", "Chia pudding (1 pc.)", "Vegan bread (400 g)", "Vegan spread (40 g)", "Cucumber (1 pc.)", "Avocado (2 pc.)"], price: 13.50), Package(name: "Fruit Basket", products: ["Orange (3 pc.)", "Apples (5 pc.)", "Bananas (3 pc.)", "Cherries (200 g)", "Strawberries (150 g)", "Blueberries (150 g)", "Watermelon (1 pc.)"], price: 9.99)]
    
    var body: some View {
        NavigationView {
            VStack {
                //Picker for Selected Category
                Picker("SelectedCategoryOrder", selection: $selectedCategoryOrder.onChange(changeBackground)) {
                    Text("Nutrition").tag(0)
                        .padding()
                    Text("Cleaning").tag(1)
                        .padding()
                }
                .padding()
                .pickerStyle(.segmented)
                
                if (selectedCategoryOrder == 0) {
                    //Packages
                    List(packages){ package in
                        PackageView(package: package)
                    }.scrollContentBackground(.hidden)
                    
                    
                    
                } else {
                    Spacer()
                    
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
                            .background(.white)
                            .cornerRadius(25)
                        
                        
                        Button("Order") {
                            //ACTION
                            //TODO - accept order for cleaning
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .border(.blue)
                        .background(.white)
                        
                        Text("Your will get a message if someone is ready for the service!")
                            .foregroundColor(.gray)
                            .multilineTextAlignment(.center)
                            .padding()
                        
                    }
                    
                }
                Spacer()
            }
            .background(
                Image(background)
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                //.frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                    .scaledToFill()
                    .opacity(0.7)
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
    /**
     Changes background image
     */
    func changeBackground(to value: Int){
        if (value == 1){
            self.background = "cleaning1"
        }else{
            self.background = "breakfast2"
        }
        
    }
}


struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView()
    }
}
extension Binding {
    func onChange(_ handler: @escaping (Value) -> Void) -> Binding<Value> {
        Binding(
            get: { self.wrappedValue },
            set: { newValue in
                self.wrappedValue = newValue
                handler(newValue)
            }
        )
    }
}
