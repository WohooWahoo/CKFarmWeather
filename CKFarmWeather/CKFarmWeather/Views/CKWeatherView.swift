//
//  CKWeatherView.swift
//  CKFarmWeather
//
//  Created by Randall Bowles on 2023-06-18.
//

import SwiftUI

struct CKWeatherView: View {
   var weather: ResponseBody

   func getLogo(forWeatherText weatherText: String) -> String {
      switch weatherText {
      case "Clear":
         return "sun.max.fill"
      case "Clouds":
         return "cloud.fill"
      case "Rain":
         return "cloud.rain.fill"
      case "Drizzle":
         return "cloud.drizzle.fill"
      case "Thunderstorm":
         return "cloud.bolt.rain.fill"
      case "Snow":
         return "cloud.snow.fill"
      case "Mist":
         return "humidity.fill"
      case "Smoke":
         return "smoke.fill"
      case "Haze":
         return "sun.haze.fill"
      case "Dust":
         return "sun.dust.fill"
      case "Fog":
         return "cloud.fog.fill"
      case "Sand", "Ash":
         return "aqi.high"
      case "Squall":
         return "wind"
      case "Tornado":
         return "tornado"
      default:
         return "questionmark"
      }
   }

   var body: some View {
      let weatherText = weather.weather[0].main
      let weatherLogo = getLogo(forWeatherText: weatherText)

      ZStack(alignment: .leading) {
         VStack {
            VStack(alignment: .leading, spacing: 5) {
               Text(weather.name)
                  .bold()
                  .font(.title)
               Text("Today, \(Date().formatted(.dateTime.month().day().hour().minute()))")
                  .fontWeight(.light)
            }
            .frame(maxWidth: .infinity, alignment: .leading)

            Spacer()

            VStack {
               HStack {
                  VStack(spacing: 20) {
                     Image(systemName: weatherLogo)
                        .font(.system(size: 40))
                     Text(weatherText)
                  }
                  .frame(width: 150, alignment: .leading)

                  Spacer()

                  Text(weather.main.feelsLike.roundDouble() + "°")
                     .font(.system(size: 75))
                     .fontWeight(.bold)
                     .padding()
               }

               Spacer()
                  .frame(height: 80)

               AsyncImage(url: URL(string: "https:cdn.pixabay.com/photo/2020/01/24/21/33/city-4791269_960_720.png")) {
                  image in image
                     .resizable()
                     .aspectRatio(contentMode: .fit)
                     .frame(width: 350)
               } placeholder: {
                  ProgressView()
               }

               Spacer()
            }
            .frame(maxWidth: .infinity)
         }
         .padding()
         .frame(maxWidth: .infinity, alignment: .leading)

         VStack {
            Spacer()

            VStack(alignment: .leading, spacing: 20) {
               Text("Weather Ahorita")
                  .bold()
                  .padding(.bottom)

               HStack {
                  CKFarmWeatherRow(logo: "thermometer", name: "Min temp", value: weather.main.tempMin.roundDouble() + "°")
                  Spacer()
                   CKFarmWeatherRow(logo: "thermometer", name: "Max temp", value: weather.main.tempMax.roundDouble() + "°")
               }
               HStack {
                   CKFarmWeatherRow(logo: "wind", name: "Wind speed", value: weather.wind.speed.roundDouble() + " m/s")
                  Spacer()
                   CKFarmWeatherRow(logo: "humidity", name: "Humidity", value: weather.main.humidity.roundDouble() + "%")
               }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
            .padding(.bottom, 20)
            .foregroundColor(Color(hue: 0.192, saturation: 0.787, brightness: 0.354))
            .background(.cyan)
            .cornerRadius(20, corners: [.topLeft, .topRight])
         }
      }
      .edgesIgnoringSafeArea(.bottom)
      .background(Color(hue: 0.192, saturation: 0.787, brightness: 0.354))
      .preferredColorScheme(.dark)
   }
}

struct CKWeatherView_Previews: PreviewProvider {
   static var previews: some View {
      CKWeatherView(weather: previewWeather)
   }
}
