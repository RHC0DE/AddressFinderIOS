//
//  MapView.swift
//  AddressFinder
//
//  Created by RHC0DE on 06/07/2022.
//

import SwiftUI
import MapKit

/*
 This view represents a map with cordinates and annotation items retrieved from the API.
 */
struct MapView: View {
    
    @StateObject private var mapAPI = MapAPI()
    @State private var searchAddressQuery = ""


    var body: some View {
        
        VStack {
            
            HStack {
                TextField(Strings.MapPage.enterAddress, text: $searchAddressQuery)
                    .textFieldStyle(.roundedBorder)
                    .padding(.horizontal)
                
                
            }

            
            Button(Strings.MapPage.findAddress) {
                mapAPI.getLocation(address: searchAddressQuery, delta: 0.5)
            }
            
            Map(coordinateRegion: $mapAPI.region, annotationItems: mapAPI.locations) {
                 location in
                MapMarker(coordinate: location.coordinate, tint: Color.red)
                
            }
            .ignoresSafeArea()
           
        }
        
    }
    
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
