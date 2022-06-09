//
//  PurchaseSubscription.swift
//  PaperlessWork
//
//  Created by Dax Gerber on 6/9/22.
//

import SwiftUI

struct PurchaseSubscription: View {
    
    @EnvironmentObject var model: SurveyModel
    
    var body: some View {
        
        ZStack {
            BackgroundView()
            VStack(alignment: .center, spacing: 75) {
                Text("Welcome!")
                    .font(.system(size: 80, weight: .semibold))
                    .foregroundColor(.white)
                    .padding(.top, 20)
                Image("pwimage")
                    .resizable()
                    .frame(width: UIScreen.main.bounds.width*5/9, height: UIScreen.main.bounds.width*5/9)
                    .cornerRadius(10)
                    
                VStack(alignment: .center, spacing: 20) {
                    VStack {
                        Text("Please choose a subscription:")
                            .foregroundColor(.white)
                            .font(Font.title2)
                            .frame(width: UIScreen.main.bounds.width*4/9)
                        Text("(1/3 off for an annual subscription)")
                            .foregroundColor(.white)
                            .font(.subheadline)
                    }
                    Button {
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
                    Spacer()
                }
            }
        }

        
    }
}


