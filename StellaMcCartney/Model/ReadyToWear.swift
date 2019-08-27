//
//  ReadyToWear.swift
//  StellaMcCartney
//
//  Created by Vinicius Leal on 27/08/19.
//  Copyright © 2019 Vinicius Leal. All rights reserved.
//
import Foundation

// MARK: - ProductReadyToWear
struct ProductReadyToWear: Codable {
    let header: Header
    let resultsLite: ResultsLiteReadyToWear
    
    enum CodingKeys: String, CodingKey {
        case header = "Header"
        case resultsLite = "ResultsLite"
    }
}
//
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
struct ResultsLiteReadyToWear: Codable {
    let totalResults: Int
    let items: [ReadyToWear]
    
    enum CodingKeys: String, CodingKey {
        case totalResults = "TotalResults"
        case items = "Items"
    }
}

// MARK: - Item
struct ReadyToWear: Codable {
    let code8: String
    let brandName: BrandName
    let defaultCode10, microCategory, macroCategory: String
    let fullPrice, discountedPrice: Int
    let modelNames: String?
    let sizes: [SizeReadyToWear]
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

//// MARK: - Color
//struct Color: Codable {
//    let id: Int
//
//    enum CodingKeys: String, CodingKey {
//        case id = "Id"
//    }
//}

// MARK: - Size
struct SizeReadyToWear: Codable {
    let text: String
    let classFamily: ClassFamilyReadyToWear
    
    enum CodingKeys: String, CodingKey {
        case text = "Text"
        case classFamily = "ClassFamily"
    }
}
//
enum ClassFamilyReadyToWear: String, Codable {
    case it = "IT"
    case jeans = "jeans"
}
