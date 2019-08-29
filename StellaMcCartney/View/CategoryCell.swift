//
//  MainDepartmentCell.swift
//  StellaMcCartney
//
//  Created by Vinicius Leal on 27/08/19.
//  Copyright © 2019 Vinicius Leal. All rights reserved.
//

import UIKit

class CategoryCell: BaseCell {
    
    var category: Category? {
        didSet {
            categoryNameLabel.text = category?.name.uppercased()
            shopNowLabel.text = "SHOP NOW"
            setCategoryImage()
        }
    }
    
    let categoryImageView: CachedImageView = {
        let imageView = CachedImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    let titleContainerView = UIView(color: .white, borderColor: UIColor.black.cgColor, borderWidth: 2)
    
    let categoryNameLabel = UILabel(font: UIFont(name: Font.semibold, size: 18)!)
    
    let shopNowLabel = UILabel(font: UIFont(name: Font.regular, size: 16)!)
    
    override func setupViews() {
        
        addSubview(categoryImageView)
        categoryImageView.fillSuperview()
        
        addSubview(titleContainerView)
        titleContainerView.anchor(top: nil, leading: self.leadingAnchor, bottom: self.bottomAnchor, trailing: self.trailingAnchor, padding: UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20), size: CGSize(width: 0, height: 80))
        
        let labelVerticalStack = VerticalStackView(arrangedSubviews: [categoryNameLabel, shopNowLabel], spacing: 0)
        shopNowLabel.constrainHeight(constant: 40)
        categoryNameLabel.constrainHeight(constant: 40)
        
        shopNowLabel.backgroundColor = .black
        shopNowLabel.textColor = .white
        
        titleContainerView.addSubview(labelVerticalStack)
        labelVerticalStack.fillSuperview()
    }
    
    func setCategoryImage() {
        if let categoryImageUrl = category?.imageUrl {
            
            categoryImageView.loadImage(urlString: categoryImageUrl)
        }
    }
    
}
