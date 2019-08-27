//
//  ProductListViewController.swift
//  StellaMcCartney
//
//  Created by Vinicius Leal on 27/08/19.
//  Copyright © 2019 Vinicius Leal. All rights reserved.
//

import UIKit

class ProductListViewController: UICollectionViewController {

    let productCellId = "cellId"
    
    var product: Product?
    var items = [Item]()
    
    var jsonUrlReceived: String?
    
    func fetchProductsInformation(jsonUrl: String) {
        
        Service.shared.fetchMainBeauty(urlString: jsonUrl) { (res) in
            switch res {
            case .success(let product):
                self.product = product
            case .failure(let err):
                print("Failure to fetch product:", err)
            }
            
            guard let product = self.product else {return}
            self.items = product.resultsLite.items
            
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
    
    init(url: String) {
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
        self.jsonUrlReceived = url
        fetchProductsInformation(jsonUrl: self.jsonUrlReceived ?? "")
        
        collectionView.backgroundColor = .lightGray
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.register(ProductCell.self, forCellWithReuseIdentifier: productCellId)
    }
}

extension ProductListViewController: UICollectionViewDelegateFlowLayout {
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 15
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (view.frame.width - 34) / 2, height: 375)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 32, left: 0, bottom: 8, right: 0)
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: productCellId, for: indexPath) as! ProductCell
        
        let item = items[indexPath.item]
        cell.product = item
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        guard let cell = collectionView.cellForItem(at: indexPath) as? ProductCell else { return }
        guard let product = cell.product else { return }
        let detailController = DetailViewController(url: product.defaultCode10)

        detailController.title = product.modelNames
        navigationController?.pushViewController(detailController, animated: true)
    }
    
}
