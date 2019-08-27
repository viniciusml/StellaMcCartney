//
//  DetailViewController.swift
//  StellaMcCartney
//
//  Created by Vinicius Leal on 27/08/19.
//  Copyright © 2019 Vinicius Leal. All rights reserved.
//

import Foundation
import UIKit

class DetailViewController: UIViewController {
    
    let productDetailImageView: CustomImageView = {
        let imageView = CustomImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    var defaultCode10Received: String?
    
    init(url: String) {
        super.init(nibName: nil, bundle: nil)
        self.defaultCode10Received = url
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setProductDetailImage(with defaultCode10: String) {
        
        let firstTwoNumbers = defaultCode10.prefix(2)
        let url = "https://www.stellamccartney.com/\(firstTwoNumbers)/\(defaultCode10)_13_c.jpg"
        
        productDetailImageView.loadImageUsingUrlString(url)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(productDetailImageView)
        productDetailImageView.constrainHeight(constant: 425)
        productDetailImageView.anchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor)
        
        view.backgroundColor = .lightGray
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        guard let defaultCode = defaultCode10Received else { return }
        setProductDetailImage(with: defaultCode)
    }
}
