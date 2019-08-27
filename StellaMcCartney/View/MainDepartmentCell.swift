//
//  MainDepartmentCell.swift
//  StellaMcCartney
//
//  Created by Vinicius Leal on 27/08/19.
//  Copyright © 2019 Vinicius Leal. All rights reserved.
//

import UIKit

class MainDepartmentCell: BaseCell {
    
    let departmentImageView: CustomImageView = {
        let imageView = CustomImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    let departmentName: UILabel = {
        let label = UILabel()
        label.textColor = .black
        return label
    }()
    
    var item: Department? {
        didSet {
            departmentName.text = item?.name
            
            setDepartmentImage()
        }
    }
    
    func setDepartmentImage() {
        if let departmentImageUrl = item?.imageUrl {
            
            departmentImageView.loadImageUsingUrlString(departmentImageUrl)
        }
    }
    
    override func setupViews() {
        
        addSubview(departmentImageView)
        departmentImageView.fillSuperview()
        
        addSubview(departmentName)
        departmentName.fillSuperview()
    }
    
}
