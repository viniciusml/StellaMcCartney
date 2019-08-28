//
//  DetailViewController.swift
//  StellaMcCartney
//
//  Created by Vinicius Leal on 27/08/19.
//  Copyright © 2019 Vinicius Leal. All rights reserved.
//

import Foundation
import UIKit

enum Detail: String {
    case ModelNames = "ModelNames"
    case MicroCategory = "MicroCategory"
    case title = "Title"
}

class DetailViewController: UIViewController {
    
    let productDetailImageView: CustomImageView = {
        let imageView = CustomImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    var defaultCode10Received: String?
    var code8Received: String?
    
    var descriptions = [Description]()
    
    var productDetail: ProductDetail?
    
    let productTitle: UILabel = {
        let label = UILabel()
        return label
    }()
    
    let microCategory: UILabel = {
        let label = UILabel()
        return label
    }()
    
    let fullPrice: UILabel = {
        let label = UILabel()
        return label
    }()
    
    let discountedPrice: UILabel = {
        let label = UILabel()
        return label
    }()
    
    let modelName: UILabel = {
        let label = UILabel()
        return label
    }()
    
    init(url: String, productCode8: String) {
        super.init(nibName: nil, bundle: nil)
        self.defaultCode10Received = url
        self.code8Received = productCode8
        
        fetchProductDetail(code8: self.code8Received ?? "")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func fetchProductDetail(code8: String) {
        
        Service.shared.fetchProductDetail(code8: code8) { (res) in
            switch res {
            case .success(let productDetail):
                self.productDetail = productDetail
            case .failure(let err):
                print("Failure to fetch details:", err)
            }
            
            DispatchQueue.main.async {
                guard let productDetail = self.productDetail else { return }
                self.descriptions = productDetail.item.descriptions
                
                self.fullPrice.text = String(describing: productDetail.item.price.fullPrice)
                self.discountedPrice.text = String(describing: productDetail.item.price.discountedPrice)
                
                self.modelName.text = self.populateLabel(for: .ModelNames)
                self.productTitle.text = self.populateLabel(for: .title)
                self.microCategory.text = self.populateLabel(for: .MicroCategory)
                
                print(productDetail.item.isNewArrival)
            }
        }
    }
    
    func populateLabel(for detail: Detail) -> String {
        
        let labelInformation = descriptions.filter { $0.key == detail.rawValue }.reduce("") { $0 + $1.value }
        
        return labelInformation
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
        productDetailImageView.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor)
        
        view.backgroundColor = .lightGray
        
        setupSubViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        guard let defaultCode = defaultCode10Received else { return }
        setProductDetailImage(with: defaultCode)
        
    }
    
    func setupSubViews() {
        
        let labels = [fullPrice, discountedPrice, productTitle, microCategory, modelName]
        labels.forEach { (label) in
            label.constrainHeight(constant: 50)
            label.textAlignment = .center
        }
        
        let vStack = VerticalStackView(arrangedSubviews: labels)
        view.addSubview(vStack)
        
        vStack.anchor(top: productDetailImageView.bottomAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor)
        
        
        productTitle.text = "lalalalalala"
        microCategory.text = "mksmaasmklsdmds"
        modelName.text = "akspoksaokas"
        fullPrice.text = "jasijasoisaj"
        discountedPrice.text = "aspksaokapaosk"
    }
}

//Stack Views
class VerticalStackView: UIStackView {
    
    init(arrangedSubviews: [UIView], spacing: CGFloat = 0) {
        super.init(frame: .zero)
        
        arrangedSubviews.forEach({addArrangedSubview($0)})
        
        self.spacing = spacing
        self.axis = .vertical
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
