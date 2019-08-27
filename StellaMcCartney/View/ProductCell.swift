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
    
    lazy var productImageView: CustomImageView = {
        let imageView = CustomImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .red
        imageView.clipsToBounds = true
        imageView.constrainHeight(constant: 230)
        return imageView
    }()
    
    lazy var productName: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.numberOfLines = 1
        label.constrainHeight(constant: 37)
        label.textAlignment = .center
        return label
    }()
    
    lazy var fullPriceLabel: UILabel = {
        let label = UILabel()
        label.constrainHeight(constant: 28)
        label.textAlignment = .center
        return label
    }()
    
    lazy var discountPriceLabel: UILabel = {
        let label = UILabel()
        label.constrainHeight(constant: 18)
        label.textAlignment = .center
        return label
    }()
    
    var product: Item? {
        didSet {
            guard let product = product else { return }
            productName.text = product.modelNames
            fullPriceLabel.text = String(describing: product.fullPrice)
            discountPriceLabel.text = String(describing: product.discountedPrice)
            
            setProductImage(defaultCode10: product.defaultCode10)
        }
    }
    
    func setProductImage(defaultCode10: String) {

        let firstTwoNumbers = defaultCode10.prefix(2)
        let url = "https://www.stellamccartney.com/\(firstTwoNumbers)/\(defaultCode10)_11_c.jpg"
        
        productImageView.loadImageUsingUrlString(url)
    }
    
    override func setupViews() {
        backgroundColor = .white
        
        addSubview(productImageView)
        productImageView.anchor(top: self.topAnchor, leading: self.leadingAnchor, bottom: nil, trailing: self.trailingAnchor, padding: UIEdgeInsets(top: 26, left: 0, bottom: 0, right: 0))
        
        addSubview(productName)
        productName.anchor(top: productImageView.bottomAnchor, leading: self.leadingAnchor, bottom: nil, trailing: self.trailingAnchor)
        
        addSubview(fullPriceLabel)
        fullPriceLabel.anchor(top: productName.bottomAnchor, leading: self.leadingAnchor, bottom: nil, trailing: self.trailingAnchor)
        
        addSubview(discountPriceLabel)
        discountPriceLabel.anchor(top: fullPriceLabel.bottomAnchor, leading: self.leadingAnchor, bottom: nil, trailing: self.trailingAnchor)
    }
    
}
