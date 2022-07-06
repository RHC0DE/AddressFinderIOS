//
//  LocationAccess.swift
//  AddressFinder
//
//  Created by RHC0DE on 05/07/2022.
//  Source: https://github.com/abuanwar072/20-Error-Pages-SwiftUI
//

import SwiftUI

struct NoLocationAccess: View {
    var body: some View {
        ZStack (alignment: Alignment(horizontal: .center, vertical: .bottom)) {
            Image( "9_Location Error")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(.all)
                .padding()
            
            VStack (alignment: .center, spacing: 30) {
                Text(Strings.NoLocationAccesPage.isNeccary)
                    .font(.title)
                    .multilineTextAlignment(.center)
                    .padding()

                
                Text(Strings.NoLocationAccesPage.pleaseEnable)
                    .multilineTextAlignment(.center)
                    .opacity(0.7)
                    .padding()
            
                
            }
            .padding(.horizontal, 70)
            .padding(.bottom, UIScreen.main.bounds.height * 0.1)
        }
    }
}

struct LocationAccess_Previews: PreviewProvider {
    static var previews: some View {
        NoLocationAccess()
    }
}
