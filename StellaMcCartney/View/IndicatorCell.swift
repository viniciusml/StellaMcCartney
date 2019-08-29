//
//  IndicatorCell.swift
//  StellaMcCartney
//
//  Created by Vinicius Leal on 29/08/19.
//  Copyright © 2019 Vinicius Leal. All rights reserved.
//

import Foundation
import UIKit

class IndicatorCell: BaseCell {
    
    let testView: UIView = {
        let iv = UIView()
        iv.backgroundColor = .gainsboroGray
        iv.layer.cornerRadius = 4
        iv.clipsToBounds = true
        return iv
    }()
    
    override var isSelected: Bool {
        didSet {
            testView.backgroundColor = isSelected ? .black : .gainsboroGray
        }
    }
    
    override func setupViews() {
        super.setupViews()
        
        isUserInteractionEnabled = false
        
        addSubview(testView)
        testView.constrainHeight(constant: 8)
        testView.constrainWidth(constant: 8)
        testView.centerInSuperview()
    }
}
