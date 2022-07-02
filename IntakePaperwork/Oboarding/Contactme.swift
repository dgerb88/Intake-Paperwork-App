//
//  Contactme.swift
//  PaperlessWork
//
//  Created by Dax Gerber on 6/24/22.
//

import SwiftUI

struct ContactMe: View {
    
    var email = "dax.paperlesswork@gmail.com"
    
    var body: some View {
        ZStack(alignment: .bottom) {
            BackgroundView()
            VStack(alignment: .center) {
                List {
                    Text("For questions, concerns, and feedback please email \(email)")
                        .font(Font.title2.weight(.semibold))
                        .foregroundColor(.black)
                }.padding(.top)
            }.padding(.top)
        }.navigationBarTitleDisplayMode( .inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Contact us")
                        .bold()
                        .foregroundColor(.white)
                        .font(.largeTitle)
                }
            }
    }
}


