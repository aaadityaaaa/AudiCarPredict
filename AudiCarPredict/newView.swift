//
//  newView.swift
//  AudiCarPredict
//
//  Created by Aaditya Singh on 14/07/21.
//

import SwiftUI


//
//class calculations: ObservableObject {
//
//
//
//
//}

struct newView: View {
    
    let model = AudiCar()
    
    @ObservedObject var values: impData
   @State var price = ""
    var body: some View {
        
        ZStack {
            Image("easy")
                .resizable()
                .ignoresSafeArea()
            VStack {
                
            Text("calculated price is ")
                .fontWeight(.light)
                .font(.largeTitle)
                .foregroundColor(.white)
            Text(price)
                .fontWeight(.light)
                .font(.largeTitle)
                .foregroundColor(.white)
                    .onAppear {
                        calculatePrice()
                    }
            }
        }
           
       
                    
    }
        func calculatePrice() {
            
           do {
            let AudiCarOutput =  try model.prediction(model: String(values.nameSelection), year: Double(values.yearSelection), transmission: String(values.transmisssionSelec), mileage: Double(values.mileage), fuelType: String(values.fuelSelection))
                
                price = String("$\(Int(AudiCarOutput.price))")

           }

           catch {

           }
     
        }

   
}

struct newView_Previews: PreviewProvider {
    static var previews: some View {
        newView(values: impData())
    }
}
