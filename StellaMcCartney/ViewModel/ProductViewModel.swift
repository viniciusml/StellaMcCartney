//
//  ProductViewModel.swift
//  StellaMcCartney
//
//  Created by Vinicius Leal on 28/08/19.
//  Copyright © 2019 Vinicius Leal. All rights reserved.
//

import Foundation

struct ProductViewModel {
    
    let productTitle: String
    let fullPrice: String
    let discountPrice: String
    let defaultCode10: String
    let code8: String
    
    init(product: Item) {
        self.productTitle = product.modelNames?.replacingOccurrences(of: "<br>", with: "\n") ?? ""
        
        self.defaultCode10 = product.defaultCode10
        self.code8 = product.code8
        
        if product.fullPrice != product.discountedPrice {
            self.fullPrice = "€\(product.discountedPrice)"
            self.discountPrice = "Was €\(product.fullPrice)"
        } else {
            self.fullPrice = "€\(product.fullPrice)"
            self.discountPrice = "Was €300"
        }
    }
}
