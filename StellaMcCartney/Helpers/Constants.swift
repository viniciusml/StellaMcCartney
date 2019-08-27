//
//  Constants.swift
//  StellaMcCartney
//
//  Created by Vinicius Leal on 27/08/19.
//  Copyright © 2019 Vinicius Leal. All rights reserved.
//

import Foundation

struct SearchAPI {
    
    static let readyToWear = "http://api.yoox.biz/Search.API/1.3/SMC_IT/search/results.json?ave=prod&productsPerPage=50&gender=D&page=1&department=Main_Ready_To_Wear&format=lite&sortRule=Ranking"
    
    static let accessories = "http://api.yoox.biz/Search.API/1.3/SMC_IT/search/results.json?ave=prod&productsPerPage=50&gender=D&page=1&department=Main_Accessories_All&format=lite&sortRule=Ranking"
    
    static let beauty = "http://api.yoox.biz/Search.API/1.3/SMC_IT/search/results.json?ave=prod&productsPerPage=50&gender=D&page=1&department=Main_Beauty&format=lite&sortRule=Ranking"
    
    static let lingerie = "http://api.yoox.biz/Search.API/1.3/SMC_IT/search/results.json?ave=prod&productsPerPage=50&gender=D&page=1&department=Main_Lingerie&format=lite&sortRule=Ranking"
}

struct ImageUrl {
    
    static let readyToWear = "https://www.stellamccartney.com/41/41924061MK_11_c.jpg"
    
    static let accessories = "https://www.stellamccartney.com/46/46642086NU_11_c.jpg"
    
    static let beauty = "https://www.stellamccartney.com/48/48199194BH_11_c.jpg"
    
    static let lingerie = "https://www.stellamccartney.com/51/51125261DF_11_c.jpg"
}
