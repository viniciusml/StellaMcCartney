//
//  Service.swift
//  StellaMcCartney
//
//  Created by Vinicius Leal on 26/08/19.
//  Copyright © 2019 Vinicius Leal. All rights reserved.
//

import Foundation

/// Fetch data from API.
class Service {
    
    static let shared = Service()
    
    /// Fetch list of products for category.
    func fetchProductList(urlString: String, completion: @escaping (Result<Product, Error>) -> ()) {
        
        guard let url = URL(string: "http://api.yoox.biz/Search.API/1.3/SMC_IT/search/results.json?ave=prod&productsPerPage=50&gender=D&page=1&department=Main_\(urlString)&format=lite&sortRule=Ranking") else { return }
        
        URLSession.shared.dataTask(with: url) { (data, resp, err) in
            
            // Handle error
            if let err = err {
                completion(.failure(err))
                return
            }
            
            do {
                let products = try JSONDecoder().decode(Product.self, from: data!)
                completion(.success(products))
            } catch let jsonError {
                completion(.failure(jsonError))
            }
            
            }.resume()
    }
    
    /// Fetch details of specific product.
    func fetchProductDetail(code8: String, completion: @escaping (Result<ProductDetail, Error>) -> ()) {
        
        guard let url = URL(string: "http://api.yoox.biz/Item.API/1.0/SMC_IT/item/\(code8).json") else { return }
        
        URLSession.shared.dataTask(with: url) { (data, resp, err) in
            
            // Handle error
            if let err = err {
                completion(.failure(err))
                return
            }
            
            do {
                let productDetail = try JSONDecoder().decode(ProductDetail.self, from: data!)
                completion(.success(productDetail))
            } catch let jsonError {
                completion(.failure(jsonError))
            }
            
            }.resume()
    }
}
