//
//  CKLoadingView.swift
//  CKFarmWeather
//
//  Created by Randall Bowles on 2023-06-18.
//

import SwiftUI

struct CKLoadingView: View {
   var body: some View {
      ProgressView()
         .progressViewStyle(CircularProgressViewStyle(tint: .white))
         .frame(maxWidth: .infinity, maxHeight: .infinity)
   }
}

struct CKLoadingView_Previews: PreviewProvider {
   static var previews: some View {
      CKLoadingView()
   }
}
