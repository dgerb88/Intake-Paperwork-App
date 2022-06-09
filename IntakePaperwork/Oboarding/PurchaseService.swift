//
//  PurchaseService.swift
//  PaperlessWork
//
//  Created by Dax Gerber on 6/8/22.
//

import Foundation
import RevenueCat

class PurchaseService {
    
    static func purchase(productId: String?, successfulPurchase:@escaping () -> Void) {
        
        guard productId != nil else {
            return
        }
        Purchases.shared.getProducts([productId!]) { (products) in
            
            if !products.isEmpty {
                
                let skProduct = products[0]
                
                Purchases.shared.purchase(product: skProduct) { transaction, purchaserInfo, error, userCancel in
                    
                    if error == nil && !userCancel {
                        successfulPurchase()
                    }
                }
            }
        }
    }
}
