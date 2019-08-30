//
//  ProductDetailViewModel.swift
//  StellaMcCartney
//
//  Created by Vinicius Leal on 28/08/19.
//  Copyright © 2019 Vinicius Leal. All rights reserved.
//

import Foundation

/// Keys for descriptions received in API call, for each product detail.
enum DescriptionKey: String, CustomStringConvertible {
    case ModelNames = "ModelNames"
    case MicroCategory = "MicroCategory"
    case MacroCategory = "MacroCategory"
    case EditorialDescription = "EditorialDescription"
    case Title = "Title"
    
    var description: String {
        get {
            return self.rawValue
        }
    }
}

struct ProductDetailViewModel {
    
    // MARK: - Properties
    
    let descripriptions: [Description]
    let fullPrice: String
    let discountPrice: String
    let defaultCode10: String
    let imageTypes: [String]
    
    var imagesUrl: [String] {
        return prepareUrls(for: imageTypes, defaultCode10: defaultCode10)
    }
    
    var modelNames: String {
        get {
            return prepareDescription(for: .ModelNames)
        }
    }
    
    var microCategory: String {
        return prepareDescription(for: .MicroCategory)
    }
    
    var macroCategory: String {
        return prepareDescription(for: .MacroCategory)
    }
    
    var productTitle: String {
        return prepareDescription(for: .Title)
    }
    
    var editorialDescription: String {
        return prepareDescription(for: .EditorialDescription)
    }
    
    // MARK: - Initializer
    
    init(product: ProductDetail) {

        self.defaultCode10 = product.item.defaultCode10
        self.descripriptions = product.item.descriptions
        self.imageTypes = product.item.imageTypes
        
        // Check if there is a product with a Discount Price.
        if product.item.price.fullPrice != product.item.price.discountedPrice {
            self.fullPrice = "Price: €\(product.item.price.discountedPrice)"
            self.discountPrice = "Was €\(product.item.price.fullPrice)"
        } else {
            self.fullPrice = "Price: €\(product.item.price.fullPrice)"
            self.discountPrice = ""
        }
    }
    
    /// Prepares urls to load images.
    ///
    /// Use this method to get folderIdentifier and characters representnig images available.
    /// Characters - c, g, h, i, p, q, s - are obtained by the selecting the suffix present in each image type element, after filtered by image quality, represented by a number - 8, 11, 12, 13.
    ///
    /// - Parameter imageTypes: Array of strings with image types available for a specific product.
    /// - Parameter defaultCode10: String containing code with reference to the product.
    /// - Returns: [String].
    func prepareUrls(for imageTypes: [String], defaultCode10: String) -> [String] {
        
        let folderIdentifier = defaultCode10.prefix(2)
        let availableTypes = imageTypes.filter({ $0.prefix(2) == "12" }).map({
            
            "https://www.stellamccartney.com/\(folderIdentifier)/\(defaultCode10)_12_\(String($0.suffix(1))).jpg"
            
        })
        
        //Remove possible image duplicates
        let typesWithNoDuplicates = availableTypes.removeDuplicates()
        
        return typesWithNoDuplicates
    }
    
    /// Prepares description for a specific product detail.
    ///
    /// - parameter detail: DescriptionKey
    /// - returns: String
    func prepareDescription(for detail: DescriptionKey) -> String {
        
        var descriptionFetched: String
        let description = self.descripriptions.filter { $0.key == detail.rawValue }.reduce("") { $0 + $1.value }
        
        //Deal with possible empty fields or HTML tags.
        if description.isEmpty {
            descriptionFetched = "\(detail.description): detail unavailable"
        } else if description.contains("<br>") {
            descriptionFetched = "\(detail.description): \n\(description.replacingOccurrences(of: "<br>", with: "\n"))" }
        else {
            descriptionFetched = "\(detail.description): \(description)"
        }

        return descriptionFetched
    }
}
