//
//  ProductViewModel.swift
//  StellaMcCartney
//
//  Created by Vinicius Leal on 28/08/19.
//  Copyright © 2019 Vinicius Leal. All rights reserved.
//

import Foundation

struct ProductViewModel {
    
    // MARK: - Properties
    
    let productTitle: String
    let fullPrice: String
    let discountPrice: String
    let defaultCode10: String
    let code8: String
    let microCategory: String
    var imageUrl: String {
        return prepareUrl(defaultCode10)
    }
    
    // MARK: - Initializer
    
    init(product: Item) {
        
        // Deal with possible empty fields or HTML tags.
        if product.modelNames == nil {
            self.productTitle = product.microCategory
        } else {
            self.productTitle = product.modelNames?.replacingOccurrences(of: "<br>", with: "\n") ?? ""
        }
        
        self.defaultCode10 = product.defaultCode10
        self.code8 = product.code8
        
        // Check if there is a product with a Discount Price.
        if product.fullPrice != product.discountedPrice {
            self.fullPrice = "€\(product.discountedPrice)"
            self.discountPrice = "Was €\(product.fullPrice)"
        } else {
            self.fullPrice = "€\(product.fullPrice)"
            self.discountPrice = ""
        }
        
        self.microCategory = product.microCategory
    }
    
    /// Prepares url to load image.
    ///
    /// Use this method to assemble a url with a folderIdentifier and defaultCode10, to load Product Thumbnail.
    ///
    /// - Parameter defaultCode10: String containing code with reference to the product.
    /// - Returns: String.
    func prepareUrl(_ defaultCode10: String) -> String {
        
        let folderIdentifier = defaultCode10.prefix(2)
        let url = "https://www.stellamccartney.com/\(folderIdentifier)/\(defaultCode10)_11_c.jpg"
        
        return url
    }
}
