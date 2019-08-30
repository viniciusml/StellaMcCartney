//
//  PhotoCell.swift
//  StellaMcCartney
//
//  Created by Vinicius Leal on 29/08/19.
//  Copyright © 2019 Vinicius Leal. All rights reserved.
//

import UIKit

/// Cell to be used as photo cell to be presented in PhotoCarousel.
///
/// Similar to UIPageViewController in appearence.
class PhotoCell: BaseCell {
    
    // MARK: - Properties
    
    let photoImageView: CachedImageView = {
        let photo = CachedImageView()
        photo.backgroundColor = .gainsboroGray
        return photo
    }()
    
    // MARK: - Helper functions
    
    override func setupViews() {
        super.setupViews()
        
        addSubview(photoImageView)
        photoImageView.fillSuperview()
    }
}
