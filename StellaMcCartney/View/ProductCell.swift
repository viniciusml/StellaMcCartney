//
//  ProductCell.swift
//  StellaMcCartney
//
//  Created by Vinicius Leal on 27/08/19.
//  Copyright © 2019 Vinicius Leal. All rights reserved.
//

import Foundation
import UIKit

class ProductCell: BaseCell {
    
    // MARK: - Properties
    
    var productViewModel: ProductViewModel! {
        didSet {
            productTitle.text = productViewModel.productTitle
            firstPrice.text = productViewModel.fullPrice
            secondPrice.text = productViewModel.discountPrice
            productThumbnail.loadImage(urlString: productViewModel.imageUrl)
        }
    }
    
    let productThumbnail: CachedImageView = {
        let imageView = CachedImageView()
        imageView.backgroundColor = .gainsboroGray
        return imageView
    }()
    
    let productTitle = UILabel(font: UIFont(name: Font.medium, size: 18)!, numberOfLines: 0)
    
    let firstPrice = UILabel(font: UIFont(name: Font.medium, size: 18)!)
    
    let secondPrice = UILabel(font: UIFont(name: Font.light, size: 16)!)
    
    // MARK: - Helper functions
    
    override func setupViews() {
        
        [productThumbnail ,productTitle, firstPrice, secondPrice].forEach({
            $0.backgroundColor = .white
            addSubview($0)
        })
        
        productThumbnail.anchor(top: self.topAnchor, leading: self.leadingAnchor, bottom: nil, trailing: self.trailingAnchor, padding: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0), size: CGSize(width: 0, height: 230))
        
        secondPrice.anchor(top: nil, leading: self.leadingAnchor, bottom: self.bottomAnchor, trailing: self.trailingAnchor, size: CGSize(width: 0, height: 20))
        
        firstPrice.anchor(top: nil, leading: self.leadingAnchor, bottom: secondPrice.topAnchor, trailing: self.trailingAnchor, size: CGSize(width: 0, height: 28))
        
        productTitle.anchor(top: productThumbnail.bottomAnchor, leading: self.leadingAnchor, bottom: firstPrice.topAnchor, trailing: self.trailingAnchor)
    }
    
}
