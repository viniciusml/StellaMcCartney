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
    
    func fetchMainLingerie(urlString: String, completion: @escaping (Result<ProductLingerie, Error>) -> ()) {
        
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, resp, err) in
            
            if let err = err {
                completion(.failure(err))
                return
            }
            
            do {
                let lingeries = try JSONDecoder().decode(ProductLingerie.self, from: data!)
                completion(.success(lingeries))
            } catch let jsonError {
                completion(.failure(jsonError))
            }
            
        }.resume()
    }
    
    func fetchMainAccessory(urlString: String, completion: @escaping (Result<ProductAccessory, Error>) -> ()) {
        
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, resp, err) in
            
            if let err = err {
                completion(.failure(err))
                return
            }
            
            do {
                let accessories = try JSONDecoder().decode(ProductAccessory.self, from: data!)
                completion(.success(accessories))
            } catch let jsonError {
                completion(.failure(jsonError))
            }
            
            }.resume()
    }
    
    func fetchMainReadyToWear(urlString: String, completion: @escaping (Result<ProductReadyToWear, Error>) -> ()) {
        
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, resp, err) in
            
            if let err = err {
                completion(.failure(err))
                return
            }
            
            do {
                let readyToWear = try JSONDecoder().decode(ProductReadyToWear.self, from: data!)
                completion(.success(readyToWear))
            } catch let jsonError {
                completion(.failure(jsonError))
            }
            
            }.resume()
    }
    
    func fetchMainBeauty(urlString: String, completion: @escaping (Result<ProductBeauty, Error>) -> ()) {
        
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, resp, err) in
            
            if let err = err {
                completion(.failure(err))
                return
            }
            
            do {
                let beauty = try JSONDecoder().decode(ProductBeauty.self, from: data!)
                completion(.success(beauty))
            } catch let jsonError {
                completion(.failure(jsonError))
            }
            
            }.resume()
    }
    
//    fileprivate func fetchGenericData<T: Decodable>(urlString: String, completion: @escaping (T?, Error?) -> ()) {
//
//        guard let url = URL(string: urlString) else {return}
//
//        URLSession.shared.dataTask(with: url) { (data, resp, err) in
//            if let err = err {
//                completion(nil, err)
//                return
//            }
//
//            do {
//
//                let objects = try JSONDecoder().decode(T.self, from: data!)
//                completion(objects, nil)
//
//            } catch {
//                completion(nil, error)
//            }
//            }.resume()
//
//    }
    
}
