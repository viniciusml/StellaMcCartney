//
//  MainDepartmentCell.swift
//  StellaMcCartney
//
//  Created by Vinicius Leal on 27/08/19.
//  Copyright © 2019 Vinicius Leal. All rights reserved.
//

import UIKit

class CategoryCell: BaseCell {
    
    let categoryImageView: CustomImageView = {
        let imageView = CustomImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    let categoryName: UILabel = {
        let label = UILabel()
        label.textColor = .black
        return label
    }()
    
    var category: Category? {
        didSet {
            categoryName.text = category?.name
            
            setCategoryImage()
        }
    }
    
    func setCategoryImage() {
        if let categoryImageUrl = category?.imageUrl {
            
            categoryImageView.loadImageUsingUrlString(categoryImageUrl)
        }
    }
    
    override func setupViews() {
        
        addSubview(categoryImageView)
        categoryImageView.fillSuperview()
        
        addSubview(categoryName)
        categoryName.fillSuperview()
    }
    
}
