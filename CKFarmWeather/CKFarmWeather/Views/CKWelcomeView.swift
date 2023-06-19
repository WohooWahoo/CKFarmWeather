//
//  CKFarmWelcomeView.swift
//  CKFarmWeather
//
//  Created by Randall Bowles on 2023-06-18.
//

import CoreLocationUI
import SwiftUI

struct CKWelcomeView: View {
   @EnvironmentObject var CKLocationManager: CKLocationManager

   var body: some View {
      VStack {
         VStack {
            Text("Welcome to the Weather App")
               .bold()
               .font(.title)
            Text("Please share your current location to show the weather in your current area")
               .padding()
         }
         .multilineTextAlignment(.center)
         .padding()

         LocationButton(.shareCurrentLocation) {
            CKLocationManager.requestLocation()
         }
         .cornerRadius(30)
         .symbolVariant(.fill)
         .foregroundColor(.white)
      }
      .frame(maxWidth: .infinity, maxHeight: .infinity)
   }
}

struct CKFarmWelcomeView_Previews: PreviewProvider {
   static var previews: some View {
       CKWelcomeView()
   }
}
