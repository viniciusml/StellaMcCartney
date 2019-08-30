//
//  ProductDetailViewModel.swift
//  StellaMcCartney
//
//  Created by Vinicius Leal on 28/08/19.
//  Copyright © 2019 Vinicius Leal. All rights reserved.
//

import Foundation

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
            return fetchDescription(for: .ModelNames)
        }
    }
    
    var microCategory: String {
        return fetchDescription(for: .MicroCategory)
    }
    
    var macroCategory: String {
        return fetchDescription(for: .MacroCategory)
    }
    
    var productTitle: String {
        return fetchDescription(for: .Title)
    }
    
    var editorialDescription: String {
        return fetchDescription(for: .EditorialDescription)
    }
    
    init(product: ProductDetail) {

        self.defaultCode10 = product.item.defaultCode10
        self.descripriptions = product.item.descriptions
        self.imageTypes = product.item.imageTypes
        
        if product.item.price.fullPrice != product.item.price.discountedPrice {
            self.fullPrice = "Price: €\(product.item.price.discountedPrice)"
            self.discountPrice = "Was €\(product.item.price.fullPrice)"
        } else {
            self.fullPrice = "Price: €\(product.item.price.fullPrice)"
            self.discountPrice = ""
        }
    }
    
    func prepareUrls(for imageTypes: [String], defaultCode10: String) -> [String] {
        
        let folderIdentifier = defaultCode10.prefix(2)
        let availableTypes = imageTypes.filter({ $0.prefix(2) == "12" }).map({
            
            "https://www.stellamccartney.com/\(folderIdentifier)/\(defaultCode10)_12_\(String($0.suffix(1))).jpg"
            
        })
        
        //Remove possible image duplicates
        let typesWithNoDuplicates = availableTypes.removeDuplicates()
        
        return typesWithNoDuplicates
    }
    
    func fetchDescription(for detail: DescriptionKey) -> String {
        
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
