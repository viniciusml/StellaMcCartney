//
//  Accessory.swift
//  StellaMcCartney
//
//  Created by Vinicius Leal on 27/08/19.
//  Copyright © 2019 Vinicius Leal. All rights reserved.
//

import Foundation

// MARK: - Accessory
struct ProductAccessory: Codable {
    let header: Header
    let resultsLite: ResultsLiteAccessory
    
    enum CodingKeys: String, CodingKey {
        case header = "Header"
        case resultsLite = "ResultsLite"
    }
}

//// MARK: - Header
//struct Header: Codable {
//    let statusCode: Int
//    let headerDescription: String
//
//    enum CodingKeys: String, CodingKey {
//        case statusCode = "StatusCode"
//        case headerDescription = "Description"
//    }
//}

// MARK: - ResultsLite
struct ResultsLiteAccessory: Codable {
    let totalResults: Int
    let items: [Accessory]
    
    enum CodingKeys: String, CodingKey {
        case totalResults = "TotalResults"
        case items = "Items"
    }
}

// MARK: - Item
struct Accessory: Codable {
    let code8, brandName, defaultCode10, microCategory: String
    let macroCategory: String
    let fullPrice, discountedPrice: Int
    let modelNames: String
    let sizes: [SizeAccessory]
    let colors: [Color]
    
    enum CodingKeys: String, CodingKey {
        case code8 = "Code8"
        case brandName = "BrandName"
        case defaultCode10 = "DefaultCode10"
        case microCategory = "MicroCategory"
        case macroCategory = "MacroCategory"
        case fullPrice = "FullPrice"
        case discountedPrice = "DiscountedPrice"
        case modelNames = "ModelNames"
        case sizes = "Sizes"
        case colors = "Colors"
    }
}

// MARK: - Color
//struct Color: Codable {
//    let id: Int
//
//    enum CodingKeys: String, CodingKey {
//        case id = "Id"
//    }
//}

// MARK: - Size
struct SizeAccessory: Codable {
    let text, classFamily: String

    enum CodingKeys: String, CodingKey {
        case text = "Text"
        case classFamily = "ClassFamily"
    }
}
