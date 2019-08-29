//
//  PhotoCell.swift
//  StellaMcCartney
//
//  Created by Vinicius Leal on 29/08/19.
//  Copyright © 2019 Vinicius Leal. All rights reserved.
//

import UIKit

class PhotoCell: BaseCell {
    
    let photoImageView: CachedImageView = {
        let photo = CachedImageView()
        photo.backgroundColor = .gainsboroGray
        return photo
    }()
    
    override func setupViews() {
        super.setupViews()
        
        addSubview(photoImageView)
        photoImageView.fillSuperview()
    }
}
