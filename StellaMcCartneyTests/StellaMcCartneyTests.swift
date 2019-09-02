//
//  StellaMcCartneyTests.swift
//  StellaMcCartneyTests
//
//  Created by Vinicius Leal on 02/09/19.
//  Copyright © 2019 Vinicius Leal. All rights reserved.
//

import XCTest
@testable import StellaMcCartney

class StellaMcCartneyTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    // Tests Product View Model
    func testProductViewModel() {
        
        let brandName = BrandName(rawValue: "brandName") ?? BrandName.stellaMcCARTNEY
        let item = Item(microCategory: "pant", defaultCode10: "code", fullPrice: 10, discountedPrice: 10, modelNames: "modelName", brandName: brandName, code8: "code8")
        let productViewModel = ProductViewModel(product: item)
        
        XCTAssertEqual(("€\(item.fullPrice)"), productViewModel.fullPrice)
        XCTAssertEqual(item.defaultCode10, productViewModel.defaultCode10)
        XCTAssertEqual(item.modelNames, productViewModel.productTitle)
    }
    
    // Tests Product View Model with some exception cases such as fullPrice different from discountPrice, and modelNames being nil.
    func testProductViewModelExceptionCases() {
        
        let brandName = BrandName(rawValue: "brandName") ?? BrandName.stellaMcCARTNEY
        let item = Item(microCategory: "pant", defaultCode10: "code", fullPrice: 10, discountedPrice: 08, modelNames: nil, brandName: brandName, code8: "code8")
        let productViewModel = ProductViewModel(product: item)
        
        XCTAssertEqual(("Was €\(item.fullPrice)"), productViewModel.discountPrice)
        XCTAssertEqual(item.defaultCode10, productViewModel.defaultCode10)
        XCTAssertEqual(item.microCategory, productViewModel.productTitle)
    }

}
