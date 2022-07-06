//
//  LocationRequestView.swift
//  AddressFinder
//
//  Created by RHC0DE on 05/07/2022.
//

/**
 This View represents a request for the users to enable their location services in order to use the app.
 */
import SwiftUI

struct LocationRequestView: View {
    var body: some View {
        
        NavigationView {
            
            ZStack {
                Color(hue: 0.574, saturation: 0.625, brightness: 0.896).ignoresSafeArea(.all, edges: .all).ignoresSafeArea()
                
                VStack {
                    Spacer()
                    
                    Image("Glass_Pin")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200, height: 200)
                    
                    Text(Strings.LocationRequestPage.wouldYou)
                        .font(.system(size: 28, weight: .semibold))
                        .multilineTextAlignment(.center)
                        .padding()
                    
                    Text(Strings.LocationRequestPage.startLocation)
                        .multilineTextAlignment(.center)
                        .frame(width: 190)
                        .padding()
                        
                    
                    
                    VStack {
                        
                        Button {
                            print("Clikced...")
                        } label: {
                            Text(Strings.LocationRequestPage.allowLocation)
                                .padding()
                                .font(.headline)
                                .foregroundColor(Color.black)
                        }
                        .frame(width: UIScreen.main.bounds.width)
                        .padding(.horizontal, -32)
                        .background(Color.white)
                        .clipShape(Capsule())
                        .padding()
                        
                        
                        NavigationLink(destination: NoLocationAccess().navigationBarHidden(true)) {
                            Text(Strings.LocationRequestPage.maybeLater)
                                .padding()
                                .font(.headline)
                                .foregroundColor(Color.black)
                        }
                        
                    }
                    .padding(.bottom, 32)
                }
                
            }
            .foregroundColor(Color.black)
            
        }
        
    }
}

struct LocationRequestView_Previews: PreviewProvider {
    static var previews: some View {
        LocationRequestView()
    }
}
