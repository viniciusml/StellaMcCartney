//
//  ProductDetailViewModel.swift
//  StellaMcCartney
//
//  Created by Vinicius Leal on 28/08/19.
//  Copyright © 2019 Vinicius Leal. All rights reserved.
//

import Foundation

struct ProductDetailViewModel {
    
    let descripriptions: [Description]
    let fullPrice: String
    let discountPrice: String
    let defaultCode10: String
    let microCategory: CroCategory
    var imagesUrl: [String]
    
    init(product: ProductDetail) {

        self.defaultCode10 = product.item.defaultCode10
        self.descripriptions = product.item.descriptions
        self.microCategory = product.item.microCategory
        self.imagesUrl = product.item.imageTypes
        
        if product.item.price.fullPrice != product.item.price.discountedPrice {
            self.fullPrice = "€\(product.item.price.discountedPrice)"
            self.discountPrice = "Was €\(product.item.price.fullPrice)"
        } else {
            self.fullPrice = "€\(product.item.price.fullPrice)"
            self.discountPrice = "Was £300"
        }
        
        self.imagesUrl = prepareUrl(for: imagesUrl, defaultCode10: defaultCode10)
    }
    
    func prepareUrl(for imageTypes: [String], defaultCode10: String) -> [String] {
        
        let folderIdentifier = defaultCode10.prefix(2)
        let availableTypes = imageTypes.filter({ $0.prefix(2) == "12" }).map({
            
            "https://www.stellamccartney.com/\(folderIdentifier)/\(defaultCode10)_12_\(String($0.suffix(1))).jpg"
            
        })
        
        return availableTypes
    }
}
