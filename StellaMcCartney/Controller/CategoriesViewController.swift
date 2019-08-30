//
//  ViewController.swift
//  StellaMcCartney
//
//  Created by Vinicius Leal on 26/08/19.
//  Copyright © 2019 Vinicius Leal. All rights reserved.
//

import UIKit

class CategoriesViewController: UICollectionViewController {
    
    // MARK: - Properties

    let categoryCellId = "cellId"
    
    var categories = [Category]()
    
    // MARK: - Initializers

    init() {
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    // MARK: - View Controller Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "CATEGORIES"
        
        collectionView.register(CategoryCell.self, forCellWithReuseIdentifier: categoryCellId)
        collectionView.backgroundColor = .white
        
        categories = CategoryLoader().loadCategories()
    }
    
}

// MARK: - Collection View Delegate

extension CategoriesViewController: UICollectionViewDelegateFlowLayout {
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 17
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 400)
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: categoryCellId, for: indexPath) as! CategoryCell
        
        let category = categories[indexPath.item]
        cell.category = category
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let category = categories[indexPath.item]
        
        let productController = ProductListViewController(url: category.jsonUrl)
        productController.title = category.name.uppercased()
        
        navigationController?.pushViewController(productController, animated: true)
    }
}


