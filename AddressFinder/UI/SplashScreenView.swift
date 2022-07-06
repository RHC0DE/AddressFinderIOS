//
//  SplashScreenView.swift
//  AddressFinder
//
//  Created by RHC0DE on 05/07/2022.
//

/**
 The View represents a SplashScreen with a map logo
 In this View, three @State variables: isActive, size, opacity, duration.
 If the view is active, it will show the WelcomeView and otherwise it will show the user the Spashscreen for 1.2 seconds.
 */

import SwiftUI
import MapKit

struct SplashScreenView: View {
    
    @State private var isActive = false // A boolean to check if the splashscreen is active
    @State private var size = 0.8
    @State private var opacity = 0.5
    @State private var duration = 1.2
    
    var body: some View {
        
        if isActive {
        
            ContentView()
            
        } else {
            
            VStack{
                VStack {
                    Image(systemName: "map.fill")
                        .font(.system(size: 100))
                }
                .scaleEffect(size)
                .opacity(opacity)
                .onAppear {
                    withAnimation(.easeIn(duration: duration)) {
                        self.size = 0.9
                        self.opacity = 1.0
                    }
                    
                    
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .accentColor(Color.black)
                .background(Color(hue: 0.574, saturation: 0.625, brightness: 0.896).ignoresSafeArea(.all, edges: .all))
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                        self.isActive = true
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .accentColor(Color.black)
                .background(Color(red: 0.902, green: 0.332, blue: 0.254).ignoresSafeArea(.all, edges: .all))
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                        self.isActive = true
                    }
                }
                
            }
            
        }
    }
}

struct SplashScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreenView()
    }
}
