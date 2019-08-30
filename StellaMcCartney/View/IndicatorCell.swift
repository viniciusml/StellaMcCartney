//
//  IndicatorCell.swift
//  StellaMcCartney
//
//  Created by Vinicius Leal on 29/08/19.
//  Copyright © 2019 Vinicius Leal. All rights reserved.
//

import Foundation
import UIKit

/// Cell to be used as indicator for photo cell being presented in PhotoCarousel.
///
/// Similar to UIPageControl in appearence.
class IndicatorCell: BaseCell {
    
    // MARK: - Properties
    
    let indicatorView: UIView = {
        let iv = UIView()
        iv.backgroundColor = .gainsboroGray
        iv.layer.cornerRadius = 4
        iv.clipsToBounds = true
        return iv
    }()
    
    override var isSelected: Bool {
        didSet {
            indicatorView.backgroundColor = isSelected ? .black : .gainsboroGray
        }
    }
    
    // MARK: - Helper Functions
    
    override func setupViews() {
        super.setupViews()
        
        isUserInteractionEnabled = false
        
        addSubview(indicatorView)
        indicatorView.constrainHeight(constant: 8)
        indicatorView.constrainWidth(constant: 8)
        indicatorView.centerInSuperview()
    }
}
