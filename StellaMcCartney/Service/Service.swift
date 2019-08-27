//
//  Service.swift
//  StellaMcCartney
//
//  Created by Vinicius Leal on 26/08/19.
//  Copyright © 2019 Vinicius Leal. All rights reserved.
//

import Foundation

class Service {
    
    static let shared = Service()
    
    func fetchMainBeauty(urlString: String, completion: @escaping (Result<Product, Error>) -> ()) {
        
        guard let url = URL(string: "http://api.yoox.biz/Search.API/1.3/SMC_IT/search/results.json?ave=prod&productsPerPage=50&gender=D&page=1&department=Main_\(urlString)&format=lite&sortRule=Ranking") else { return }
        
        URLSession.shared.dataTask(with: url) { (data, resp, err) in
            
            if let err = err {
                completion(.failure(err))
                return
            }
            
            do {
                let product = try JSONDecoder().decode(Product.self, from: data!)
                completion(.success(product))
            } catch let jsonError {
                completion(.failure(jsonError))
            }
            
            }.resume()
    }
}
