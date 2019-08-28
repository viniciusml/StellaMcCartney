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
        imageView.clipsToBounds = true
        imageView.constrainHeight(constant: 230)
        imageView.backgroundColor = .red
        return imageView
    }()
    
    lazy var productName: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.numberOfLines = 0
        label.textAlignment = .center
        label.lineBreakMode = .byClipping
        return label
    }()
    
    let fullPriceLabel = UILabel(font: UIFont(name: Font.medium, size: 18)!)
    
    let discountPriceLabel = UILabel(font: UIFont(name: Font.light, size: 16)!)
        
    var productViewModel: ProductViewModel! {
        didSet {
            productName.text = productViewModel.productTitle
            fullPriceLabel.text = productViewModel.fullPrice
            discountPriceLabel.text = productViewModel.discountPrice
            productImageView.loadImageUsingUrlString(prepareImageUrl(productViewModel.defaultCode10))
        }
    }
    
    override func setupViews() {
        
        addSubview(productImageView)
        productImageView.anchor(top: self.topAnchor, leading: self.leadingAnchor, bottom: nil, trailing: self.trailingAnchor, padding: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0))
        
        addSubview(discountPriceLabel)
        discountPriceLabel.constrainHeight(constant: 20)
        discountPriceLabel.anchor(top: nil, leading: self.leadingAnchor, bottom: self.bottomAnchor, trailing: self.trailingAnchor)
        
        addSubview(fullPriceLabel)
        fullPriceLabel.constrainHeight(constant: 28)
        fullPriceLabel.anchor(top: nil, leading: self.leadingAnchor, bottom: discountPriceLabel.topAnchor, trailing: self.trailingAnchor)
        
        addSubview(productName)
        productName.anchor(top: productImageView.bottomAnchor, leading: self.leadingAnchor, bottom: fullPriceLabel.topAnchor, trailing: self.trailingAnchor)
    }
    
    func prepareImageUrl(_ defaultCode10: String) -> String {
        
        let folderIdentifier = defaultCode10.prefix(2)
        let url = "https://www.stellamccartney.com/\(folderIdentifier)/\(defaultCode10)_11_c.jpg"
        
        return url
    }
}
