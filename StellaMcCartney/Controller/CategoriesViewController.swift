//
//  ViewController.swift
//  StellaMcCartney
//
//  Created by Vinicius Leal on 26/08/19.
//  Copyright © 2019 Vinicius Leal. All rights reserved.
//

import UIKit

class CategoriesViewController: UICollectionViewController {
    
    let categoryCellId = "cellId"
    
    var Categories = [Category]()
    
    init() {
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
        
        collectionView.backgroundColor = .lightGray
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.register(CategoryCell.self, forCellWithReuseIdentifier: categoryCellId)
        
        Categories = [Category(name: "Ready to wear", imageUrl: ImageUrl.readyToWear, jsonUrl: "Ready_To_Wear"),
                      Category(name: "Accessories", imageUrl: ImageUrl.accessories, jsonUrl: "Accessories_All"),
                      Category(name: "Beauty", imageUrl: ImageUrl.beauty, jsonUrl: "Beauty"),
                      Category(name: "Lingerie", imageUrl: ImageUrl.lingerie, jsonUrl: "Lingerie")]
        
        self.title = "Categories"
    }
}

extension CategoriesViewController: UICollectionViewDelegateFlowLayout {
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (view.frame.width - 40), height: (view.frame.height / 4))
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: categoryCellId, for: indexPath) as! CategoryCell
        
        let category = Categories[indexPath.item]
        
        cell.category = category
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let category = Categories[indexPath.item]
        let productController = ProductListViewController(url: category.jsonUrl)
        
        productController.title = category.name
        navigationController?.pushViewController(productController, animated: true)
    }
}


