//
//  ContentView.swift
//  AudiCarPredict
//
//  Created by Aaditya Singh on 10/07/21.
//

import SwiftUI

class impData: ObservableObject {
@Published  var nameSelection = 1
@Published  var fuelSelection = 0
@Published  var yearSelection = 3
@Published  var transmisssionSelec = 0
@Published  var mileage: Double = 0

}

struct ContentView: View {
   
//    let anything: AudiCarOutput
    @ObservedObject var values = impData()
   
    
    static let modelname = ["A1", "A3", "A4", "A5", "A6", "A7", "Q1", "Q3", "Q5", "Q7"]
    static let fuelType = ["Petrol", "Diesel"]
    static let year = [2013, 2014, 2015, 2016, 2017, 2018, 2019, 2020]
    static let transmission = ["Automatic", "Semi-Auto", "Manual"]
    
    
   
    
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    @State private var showingAlert = false
    
    
    
    var body: some View {
        
        //
            ZStack {
                Image("easy")
                    .resizable()
                    .ignoresSafeArea()
                
                VStack {
                    HStack {
                        Text("MODEL")
                            .fontWeight(.ultraLight)
                            .font(.title)
                            .foregroundColor(.black)
                            .padding()
                        Spacer()
                    }
                    
                    Picker("Your model Selection", selection: $values.nameSelection) {
                        
                        ForEach(0 ..< Self.modelname.count) {
                            somehting in
                            Text("\(Self.modelname[somehting])")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    //MARK:- first
                    
                    HStack {
                        Text("Fuel Type")
                            .fontWeight(.ultraLight)
                            .font(.title)
                            .foregroundColor(.black)
                            .padding()
                        Spacer()
                    }
                    
                    Picker("Your fuel Selection", selection: $values.fuelSelection) {
                        
                        ForEach(0 ..< Self.fuelType.count) {
                            somehting in
                            Text("\(Self.fuelType[somehting])")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    
                    //MARK:- second
                    
                    HStack {
                        Text("Transmission Type")
                            .fontWeight(.ultraLight)
                            .font(.title)
                            .foregroundColor(.black)
                            .padding()
                        Spacer()
                    }
                    
                    Picker("Your transmisson type Selection", selection: $values.transmisssionSelec) {
                        
                        ForEach(0 ..< Self.transmission.count) {
                            somehting in
                            Text("\(Self.transmission[somehting])")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    
                    //MARK:- Third
                    
                    VStack {
                        Spacer()
                        HStack {
                            Text("Year of Manufacture")
                                .fontWeight(.ultraLight)
                                .font(.title)
                                .foregroundColor(.black)
                                .padding()
                            Spacer()
                        }
                        
                        Picker("Your transmisson type Selection", selection: $values.yearSelection) {
                            
                            ForEach(0 ..< Self.year.count) {
                                somehting in
                                Text("\(Self.year[somehting])")
                            }
                        }
                        .pickerStyle(SegmentedPickerStyle())
                        
                        HStack{
                            Text("Mileage")
                                .fontWeight(.ultraLight)
                                .font(.largeTitle)
                                .foregroundColor(.black)
                                .padding()
                            Spacer()
                            
                        }
                        
                        Slider(value: $values.mileage, in: 0...90000)
                            .padding(20)
                        
                        Text("\(values.mileage, specifier: "%.2f") mi")
                            .foregroundColor(.black)
                            .fontWeight(.light)
                            .font(.largeTitle)
                        
                        Spacer()
                        
                    }
                    Spacer()
                        .frame(height: 100)
                    
                    Button {
                        
                        //calculatePrice()
                        self.showingAlert = true
                    } label: {
                        
                        Text("Calculate")
                            .foregroundColor(.green)
                            .fontWeight(.light)
                            .font(.title2)
                            .padding(20)
                            .background(Color.white)
                            .clipShape(Capsule())
                        
                    }
                    
                    .sheet(isPresented: $showingAlert) {
                        newView(values: self.values)
//                        Alert(title: Text(alertMessage), message: Text(alertTitle), dismissButton: .default(Text("OK")))
                    }
                
                    
                    
                    
                    
                }
                
                
            }
            
           // .navigationBarTitle("Trade My Audi")
        //}
        
    }
   
    
    
    
}

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        ContentView()
    }
}
