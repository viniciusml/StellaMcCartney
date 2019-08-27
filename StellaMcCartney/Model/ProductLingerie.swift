//
//  Lingerie.swift
//  StellaMcCartney
//
//  Created by Vinicius Leal on 26/08/19.
//  Copyright © 2019 Vinicius Leal. All rights reserved.
//

import Foundation

// MARK: - Lingerie
struct ProductLingerie: Codable {
    let header: Header
    let resultsLite: ResultsLiteLingerie
    
    enum CodingKeys: String, CodingKey {
        case header = "Header"
        case resultsLite = "ResultsLite"
    }
}

// MARK: - Header
struct Header: Codable {
    let statusCode: Int
    let headerDescription: String
    
    enum CodingKeys: String, CodingKey {
        case statusCode = "StatusCode"
        case headerDescription = "Description"
    }
}

// MARK: - ResultsLite
struct ResultsLiteLingerie: Codable {
    let totalResults: Int
    let items: [Lingerie]
    
    enum CodingKeys: String, CodingKey {
        case totalResults = "TotalResults"
        case items = "Items"
    }
}

// MARK: - Item
struct Lingerie: Codable {
    let code8: String
    let brandName: BrandName
    let defaultCode10: String
    let microCategory: MicroCategory
    let macroCategory: MacroCategory
    let fullPrice, discountedPrice: Int
    let modelNames: String
    let sizes: [Size]
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

enum BrandName: String, Codable {
    case stellaMcCARTNEY = "STELLA McCARTNEY"
}

// MARK: - Color
struct Color: Codable {
    let id: Int
    
    enum CodingKeys: String, CodingKey {
        case id = "Id"
    }
}

enum MacroCategory: String, Codable {
    case lingerie = "Lingerie"
}

enum MicroCategory: String, Codable {
    case body = "Body"
    case pigiama = "Pigiama"
    case reggiseno = "Reggiseno"
    case slip = "Slip"
}

// MARK: - Size
struct Size: Codable {
    let text: String
    let classFamily: ClassFamily
    
    enum CodingKeys: String, CodingKey {
        case text = "Text"
        case classFamily = "ClassFamily"
    }
}

enum ClassFamily: String, Codable {
    case int = "INT"
    case it = "IT"
}
