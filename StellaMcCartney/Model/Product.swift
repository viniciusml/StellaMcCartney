//
//  Product.swift
//  StellaMcCartney
//
//  Created by Vinicius Leal on 27/08/19.
//  Copyright © 2019 Vinicius Leal. All rights reserved.
//

import Foundation

// MARK: - Product

struct Product: Codable {
    let header: Header
    let resultsLite: ProductResults

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

// MARK: - Product Results

struct ProductResults: Codable {
    let totalResults: Int
    let items: [Item]

    enum CodingKeys: String, CodingKey {
        case totalResults = "TotalResults"
        case items = "Items"
    }
}

// MARK: - Item Detail

struct Item: Codable {
    
    enum CodingKeys: String, CodingKey {
        case brandName = "BrandName"
        case defaultCode10 = "DefaultCode10"
        case microCategory = "MicroCategory"
        case fullPrice = "FullPrice"
        case discountedPrice = "DiscountedPrice"
        case modelNames = "ModelNames"
        case code8 = "Code8"
    }
    
    let microCategory, defaultCode10: String
    let fullPrice: Int
    let discountedPrice: Int
    let modelNames: String?
    let brandName: BrandName
    let code8: String
}

// MARK: - Brand Name

enum BrandName: String, Codable {
    case stellaMcCARTNEY = "STELLA McCARTNEY"
}
