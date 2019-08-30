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
    let microCategory: String
    var imageUrl: String {
        return prepareUrl(defaultCode10)
    }
    
    init(product: Item) {
        
        if product.modelNames == nil {
            self.productTitle = product.microCategory
        } else {
            self.productTitle = product.modelNames?.replacingOccurrences(of: "<br>", with: "\n") ?? ""
        }
        
        self.defaultCode10 = product.defaultCode10
        self.code8 = product.code8
        
        if product.fullPrice != product.discountedPrice {
            self.fullPrice = "€\(product.discountedPrice)"
            self.discountPrice = "Was €\(product.fullPrice)"
        } else {
            self.fullPrice = "€\(product.fullPrice)"
            self.discountPrice = ""
        }
        
        self.microCategory = product.microCategory
    }
    
    func prepareUrl(_ defaultCode10: String) -> String {
        
        let folderIdentifier = defaultCode10.prefix(2)
        let url = "https://www.stellamccartney.com/\(folderIdentifier)/\(defaultCode10)_11_c.jpg"
        
        return url
    }
}
