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
    
    var body: some View {
        
        if loadingView == false {
            ZStack {
                BackgroundView()
                VStack(alignment: .center, spacing: 50) {
                    Text("Welcome!")
                        .font(.system(size: 80, weight: .semibold))
                        .foregroundColor(.white)
                    Image("pwimage")
                        .resizable()
                        .frame(width: UIScreen.main.bounds.width*4/9, height: UIScreen.main.bounds.width*4/9)
                        .cornerRadius(10)
                        
                    VStack(alignment: .center, spacing: 10) {
                        VStack {
                            Text("Please choose a subscription:")
                                .foregroundColor(.white)
                                .font(Font.title)
                            Text("(1/3 off for an annual subscription)")
                                .foregroundColor(.white)
                                .font(.subheadline)
                                .padding(.bottom)
                        }
                        Button {
                            loadingView = true
                            PurchaseService.purchase(productId: "Paperless_1m_sub") {
                                model.confirmPurchase = true
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

