//
//  Beauty.swift
//  StellaMcCartney
//
//  Created by Vinicius Leal on 27/08/19.
//  Copyright © 2019 Vinicius Leal. All rights reserved.
//

import Foundation

// MARK: - ProductBeauty
struct ProductBeauty: Codable {
    let header: Header
    let resultsLite: ResultsLiteBeauty
    
    enum CodingKeys: String, CodingKey {
        case header = "Header"
        case resultsLite = "ResultsLite"
    }
}

// MARK: - Header
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
struct ResultsLiteBeauty: Codable {
    let totalResults: Int
    let items: [Beauty]
    
    enum CodingKeys: String, CodingKey {
        case totalResults = "TotalResults"
        case items = "Items"
    }
}

// MARK: - Item
struct Beauty: Codable {
    let code8, brandName, defaultCode10, microCategory: String
    let macroCategory: String
    let fullPrice, discountedPrice: Int
    let modelNames: String
    let sizes: [SizeBeauty]
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
struct SizeBeauty: Codable {
    let text, classFamily: String
    
    enum CodingKeys: String, CodingKey {
        case text = "Text"
        case classFamily = "ClassFamily"
    }
}
