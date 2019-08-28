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
    
    var productViewModels = [ProductViewModel]()
    
    var jsonUrlReceived: String?
    
    func fetchProductsInformation(jsonUrl: String) {
        
        Service.shared.fetchMainBeauty(urlString: jsonUrl) { (res) in
            switch res {
            case .success(let product):
                self.productViewModels = product.resultsLite.items.map({ return ProductViewModel(product: $0)}) 
            case .failure(let err):
                print("Failure to fetch product:", err)
            }
            
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
    
    init(url: String) {
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
        self.jsonUrlReceived = url
        fetchProductsInformation(jsonUrl: self.jsonUrlReceived ?? "")
        
        collectionView.backgroundColor = .white
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
        return productViewModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 15
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (view.frame.width - 40) / 2, height: 375)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 32, left: 10, bottom: 8, right: 10)
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: productCellId, for: indexPath) as! ProductCell
        
        let productViewModel = productViewModels[indexPath.item]
        cell.productViewModel = productViewModel
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        guard let cell = collectionView.cellForItem(at: indexPath) as? ProductCell else { return }
        guard let productViewModel = cell.productViewModel else { return }
        let detailController = DetailViewController(url: productViewModel.defaultCode10, productCode8: productViewModel.code8)

        print(productViewModel.defaultCode10)
        detailController.title = productViewModel.productTitle
        navigationController?.pushViewController(detailController, animated: true)
    }
    
}
