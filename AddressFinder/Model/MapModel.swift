//
//  MapModel.swift
//  AddressFinder
//
//  Created by RHC0DE on 06/07/2022.
//

/*
 This file is used to manage the API Request and structuring the data model.
 With the 'Find Address' button click in the ContentView() all cordinates get returned and eventiually pushed in to the Mapkit
 */
import Foundation
import MapKit

struct Address: Codable {
    let data: [Datum]
}

struct Datum: Codable {
    let latitude, longitude: Double
    let name: String?

    
}

struct Locatation: Identifiable {
    let id = UUID()
    let name: String
    let coordinate: CLLocationCoordinate2D
}



 
