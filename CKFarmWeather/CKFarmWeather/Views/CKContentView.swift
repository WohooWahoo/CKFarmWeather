//
//  CKContentView.swift
//  CKFarmWeather
//
//  Created by Randall Bowles on 2023-06-18.
//

import SwiftUI

struct CKContentView: View {
   @StateObject var locationManager = CKLocationManager()
   var weatherManager = CKWeatherManager()
   @State var weather: ResponseBody?

   var body: some View {
      VStack {
         if let location = locationManager.location {
            if let weather = weather {
               CKWeatherView(weather: weather)
            } else {
               CKLoadingView()
                  .task {
                     do {
                        weather = try await weatherManager.getCurrentWeather(latitude: location.latitude, longitude: location.longitude)
                     } catch {
                        print("Error getting weather: \(error)")
                     }
                  }
            }
         } else {
            if locationManager.isLoading {
               CKLoadingView()
            } else {
               CKWelcomeView()
                  .environmentObject(locationManager)
            }
         }
      }
      .background(Color(hue: 0.656, saturation: 0.787, brightness: 0.354))
      .preferredColorScheme(.dark)
   }
}

struct CKContentView_Previews: PreviewProvider {
   static var previews: some View {
      CKContentView()
   }
}
