//
//  SwiftUIView.swift
//  IntakePaperwork
//
//  Created by Dax Gerber on 12/29/21.
//

import SwiftUI
import LocalAuthentication


struct LockedView: View {
    
    @State var isUnlocked = false
    @EnvironmentObject var model: SurveyModel

    
    var body: some View {
        ZStack {
            BackgroundView()
                .frame(width: UIScreen.main.bounds.width)
            Rectangle()
                .foregroundColor(.white)
                .padding(.top)
                .padding(.bottom)
            VStack {
                Text("Access restricted")
                    .foregroundColor(.red)
                    .font(Font.largeTitle)
                    .padding()
                Button {
                    authenticate()
                } label: {
                    Text("Try again")
                        .foregroundColor(.blue)
                        .font(Font.title3)
                }
                NavigationLink(destination: PDFRetrievalView(), isActive: $isUnlocked) {
                    EmptyView()
                }
                Spacer()
            }.padding(.top, UIScreen.main.bounds.height/4)
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                    authenticate()
                }
        }
        }
    }
    func authenticate() {
        let context = LAContext()
        var error: NSError?

        // check whether biometric authentication is possible
        if context.canEvaluatePolicy(.deviceOwnerAuthentication, error: &error) {
            // it's possible, so go ahead and use it
            let reason = "We need to unlock your data."

            context.evaluatePolicy(.deviceOwnerAuthentication, localizedReason: reason) { success, authenticationError in
                // authentication has now completed
                if success {
                    isUnlocked = true
                } else {
                    
                }
            }
        } else {
            // no biometrics
        }
    }
}

