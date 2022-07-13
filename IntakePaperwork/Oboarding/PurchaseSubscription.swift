//
//  PurchaseSubscription.swift
//  PaperlessWork
//
//  Created by Dax Gerber on 6/9/22.
//

import SwiftUI
import RevenueCat

struct PurchaseSubscription: View {
    
    @EnvironmentObject var model: SurveyModel
    @State var loadingView = false
    @State var ppNotFound = false
    
    var body: some View {
        
        if loadingView == false {
            ZStack {
                BackgroundView()
                VStack(alignment: .center, spacing: 50) {
                    Text("Paper")
                        .font(.system(size: 80, weight: .semibold))
                        .foregroundColor(.white)
                    + Text("less")
                        .font(.system(size: 80, weight: .semibold))
                        .foregroundColor(.gray)
                    + Text("work")
                        .font(.system(size: 80, weight: .semibold))
                        .foregroundColor(.white)
                    Image("Logo")
                        .resizable()
                        .frame(width: UIScreen.main.bounds.width*4/9, height: UIScreen.main.bounds.width*4/9)
                        .border(.white, width: 3)
                        .cornerRadius(5)
                        
                    VStack(alignment: .center, spacing: 10) {
                        VStack {
                            Text("Please choose a subscription:")
                                .foregroundColor(.white)
                                .font(Font.title)
                            Text("(Enjoy the first 7 days free!)")
                                .foregroundColor(.white)
                                .font(.subheadline)
                                .padding(.bottom)
                        }
                        Button {
                            loadingView = true
                            PurchaseService.purchase(productId: "Paperless_1m_sub") {
                                model.confirmPurchase = true
                            }
                            DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
                                loadingView = false
                            }
                        } label: {
                                ZStack {
                                    Rectangle()
                                        .frame(width: 250, height: 100)
                                        .cornerRadius(10)
                                        .foregroundColor(.green)
                                    VStack(spacing: 10) {
                                        Text("Monthly Subscription:")
                                            .foregroundColor(.white)
                                            .font(.headline)
                                        Text("$4.99/Month")
                                            .foregroundColor(.white)
                                            .font(.headline)
                                    }
                                }
                        }

                        Button {
                            loadingView = true
                            PurchaseService.purchase(productId: "Paperlesswork_3999_1y") {
                                model.confirmPurchase = true
                            }
                            DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
                                loadingView = false
                            }
                        } label: {
                            ZStack {
                                Rectangle()
                                    .frame(width: 250, height: 100)
                                    .cornerRadius(10)
                                    .foregroundColor(.green)
                                VStack(spacing: 10) {
                                    Text("Annual Subscription:")
                                        .foregroundColor(.white)
                                        .font(.headline)
                                    Text("$39.99/year")
                                        .foregroundColor(.white)
                                        .font(.headline)
                                }
                            }
                        }
                        Button {
                            loadingView = true
                            Purchases.shared.restorePurchases { info, error in
                                //... check customerInfo to see if entitlement is now active
                                if info?.entitlements["All Access"]?.isActive == true {
                                    model.confirmPurchase = true
                                }
                                else {
                                    loadingView = false
                                    ppNotFound = true
                                }
                            }
                        } label: {
                            ZStack {
                                Rectangle()
                                    .frame(width: 250, height: 40)
                                    .cornerRadius(10)
                                    .foregroundColor(.green)
                                Text("Restore previous purchase")
                                    .foregroundColor(.white)
                            }

                        }.alert(isPresented: $ppNotFound) {
                            Alert(title: Text("No record found"), message: Text("If you believe there is an error please see customer support at dax.paperlesswork@gmail.com"), dismissButton: .default(Text("OK")))
                        }
                        Spacer()
                    }
                }
            }
        }
        else {
            ProgressView("Loading...")
        }
    }
}


