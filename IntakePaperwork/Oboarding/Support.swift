//
//  Contactme.swift
//  PaperlessWork
//
//  Created by Dax Gerber on 6/24/22.
//

import SwiftUI

struct Support: View {
    
    var email = "dax.paperlesswork@gmail.com"
    
    var body: some View {
        ZStack(alignment: .bottom) {
            BackgroundView()
            VStack(alignment: .center) {
                List {
                    Section {
                    Text("For questions, concerns, and feedback including desired additional surveys and intake forms please email \(email)")
                        .font(Font.title2)
                        .foregroundColor(.black)
                    }
                    Section {
                    Text("To cancel your subscription at any time see Settings -> Apple ID -> Subscriptions")
                        .font(Font.title2)
                        .foregroundColor(.black)
                    }
                }.padding(.top)
            }
        }.navigationBarTitleDisplayMode( .inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Support")
                        .bold()
                        .foregroundColor(.white)
                        .font(.largeTitle)
                }
            }
    }
}


