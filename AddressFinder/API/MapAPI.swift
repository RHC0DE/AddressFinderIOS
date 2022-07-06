//
//  MapAPI.swift
//  AddressFinder
//
//  Created by RHC0DE on 06/07/2022.
//

import Foundation
import MapKit



class MapAPI: ObservableObject{
   private let BASE_URL = "http://api.positionstack.com/v1/forward"
   private let API_KEY = "0040a3c0c07556aad7b3588e2679878b"
   
   @Published var region: MKCoordinateRegion //MapKit cordinate region that will be insterted in the MapKit API
   @Published var coordinates = [] // The cordinates that the app gets back from the API
   @Published var locations: [Locatation] = [] // An array for the pins or other markers on the map
   
   
   init() {
      // Defualt Info
      self.region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275), span: MKCoordinateSpan(latitudeDelta: 5, longitudeDelta: 5))
      
      self.locations.insert(Locatation(name: "Pin", coordinate: CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275)), at: 0)
   }
   
    //    /**
    //     Gets the location from the API with a request
    //     with a adress parameter of type String
    //     and a delta of the type Double that is uses for the Zoom motion in the app.
    //     This function also handles incorrect url's and addresses errors.
    //     */
   func getLocation(address: String, delta: Double) {
      let pAddress = address.replacingOccurrences(of: " ", with: "%20")
      let url_string = "\(BASE_URL)?access_key=\(API_KEY)&query=\(pAddress)"
   
      guard let url = URL(string: url_string) else {
         print("Invalid URL")
         return }
      
      URLSession.shared.dataTask(with: url) { (data, response, error) in
         guard let data = data else {
            print(error!.localizedDescription)
            return }
         
         guard let newCoordinates = try? JSONDecoder().decode(Address.self, from: data) else { return }
         
         if newCoordinates.data.isEmpty {
            print("Could not find address...")
            return
         }
         
         // Set the new data
         DispatchQueue.main.async {
            let details = newCoordinates.data[0]
            let lat = details.latitude
            let lon = details.longitude
            
            self.coordinates = [lat, lon]
            self.region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: lat, longitude: lon), span: MKCoordinateSpan(latitudeDelta: delta, longitudeDelta: delta))
            
            let new_location = Locatation(name: "\(details.name)", coordinate: CLLocationCoordinate2D(latitude: lat, longitude: lon))
            self.locations.removeAll() // One pin at a given time
            self.locations.insert(new_location, at: 0)
            
            print("Successfully loaded location! \(details.name)")
         }
      }
      .resume()
   }
}
