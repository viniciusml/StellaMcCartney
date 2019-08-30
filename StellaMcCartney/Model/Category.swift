//
//  Category.swift
//  StellaMcCartney
//
//  Created by Vinicius Leal on 27/08/19.
//  Copyright © 2019 Vinicius Leal. All rights reserved.
//

import Foundation

// MARK: - Category

struct Category {
    let name: String
    let imageUrl: String
    let jsonUrl: String
}

// MARK: - Category Loader

class CategoryLoader {
    
    func loadCategories() -> [Category] {
        
        let readyToWear = Category(name: "Ready to wear", imageUrl: ImageUrl.readyToWear, jsonUrl: "Ready_To_Wear")
        let acessories = Category(name: "Accessories", imageUrl: ImageUrl.accessories, jsonUrl: "Accessories_All")
        let beauty = Category(name: "Beauty", imageUrl: ImageUrl.beauty, jsonUrl: "Beauty")
        let lingerie = Category(name: "Lingerie", imageUrl: ImageUrl.lingerie, jsonUrl: "Lingerie")
        
        let categories = [readyToWear, acessories, beauty, lingerie]

        return categories
    }
}
