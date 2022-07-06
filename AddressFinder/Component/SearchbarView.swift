//
//  SearchbarView.swift
//  AddressFinder
//
//  Created by RHC0DE on 06/07/2022.
//

import SwiftUI
import MapKit

struct SearchbarView: View {
    @StateObject private var mapAPI = MapAPI()
    @State private var searchAddressQuery = ""
    
    var body: some View {
        
        VStack {
            TextField(Strings.SearchbarPage.enterAddress, text: $searchAddressQuery)
                .textFieldStyle(.roundedBorder)
                .padding(.horizontal)
            
            Button {
                mapAPI.getLocation(address: searchAddressQuery, delta: 0.5)
            } label: {
                Text(Strings.SearchbarPage.findAddress)
                    
            }
           
        }
    }
}

struct SearchbarView_Previews: PreviewProvider {
    static var previews: some View {
        SearchbarView()
    }
}
