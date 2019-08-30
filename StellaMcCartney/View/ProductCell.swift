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
    
    var productViewModel: ProductViewModel! {
        didSet {
            productName.text = productViewModel.productTitle
            fullPriceLabel.text = productViewModel.fullPrice
            discountPriceLabel.text = productViewModel.discountPrice
            productImageView.loadImage(urlString: productViewModel.imageUrl)

        }
    }
    
    let productImageView: CachedImageView = {
        let imageView = CachedImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    let productName = UILabel(font: UIFont(name: Font.medium, size: 18)!, numberOfLines: 0)
    
    let fullPriceLabel = UILabel(font: UIFont(name: Font.medium, size: 18)!)
    
    let discountPriceLabel = UILabel(font: UIFont(name: Font.light, size: 16)!)
    
    override func setupViews() {
        
        [productImageView ,productName, fullPriceLabel, discountPriceLabel].forEach({
            $0.backgroundColor = .white
            addSubview($0)
        })
        
        productImageView.anchor(top: self.topAnchor, leading: self.leadingAnchor, bottom: nil, trailing: self.trailingAnchor, padding: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0), size: CGSize(width: 0, height: 230))
        
        discountPriceLabel.anchor(top: nil, leading: self.leadingAnchor, bottom: self.bottomAnchor, trailing: self.trailingAnchor, size: CGSize(width: 0, height: 20))
        
        fullPriceLabel.anchor(top: nil, leading: self.leadingAnchor, bottom: discountPriceLabel.topAnchor, trailing: self.trailingAnchor, size: CGSize(width: 0, height: 28))
        
        productName.anchor(top: productImageView.bottomAnchor, leading: self.leadingAnchor, bottom: fullPriceLabel.topAnchor, trailing: self.trailingAnchor)
    }
}
