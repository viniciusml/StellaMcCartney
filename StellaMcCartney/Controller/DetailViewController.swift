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
    case MacroCategory = "MacroCategory"
    case EditorialDescription = "EditorialDescription"
    case title = "Title"
}

class DetailViewController: UIViewController, UIScrollViewDelegate {
    
    lazy var scrollView: UIScrollView = {
        let sView = UIScrollView()
        sView.backgroundColor = .white
        sView.delegate = self
        sView.contentSize.height = view.frame.height + 200
        return sView
    }()
    
    var productDetailViewModel: ProductDetailViewModel?
    
    let productTitle = UILabel(font: UIFont(name: Font.medium, size: 18)!)
    
    let microCategory = UILabel(font: UIFont(name: Font.medium, size: 18)!)
    
    let fullPrice = UILabel(font: UIFont(name: Font.medium, size: 18)!)
    
    let discountedPrice = UILabel(font: UIFont(name: Font.thin, size: 18)!)
    
    let modelName = UILabel(font: UIFont(name: Font.semibold, size: 20)!, numberOfLines: 0)
    
    let editorialDescription = UILabel(font: UIFont(name: Font.medium, size: 18)!)
    
    let macroCategory = UILabel(font: UIFont(name: Font.medium, size: 18)!)
    
    let photoCarousel = PhotoCarousel()
    
    let photoIndicator = PhotoIndicator()
    
    var imagesAvailable = [String]()
    
    init(productCode8: String) {
        super.init(nibName: nil, bundle: nil)
        
        fetchProductDetail(code8: productCode8)
    }
    
    func fetchProductDetail(code8: String) {
        
        Service.shared.fetchProductDetail(code8: code8) { (res) in
            switch res {
            case .success(let productDetail):
                self.productDetailViewModel = ProductDetailViewModel(product: productDetail)
            case .failure(let err):
                print("Failure to fetch details:", err)
            }
            
            DispatchQueue.main.async {
                guard let productDetailViewModel = self.productDetailViewModel else { return }
                
                self.fullPrice.text = String(describing: productDetailViewModel.fullPrice)
                self.discountedPrice.text = String(describing: productDetailViewModel.discountPrice)
                
                self.modelName.text = self.populateLabel(for: .ModelNames)
                self.productTitle.text = self.populateLabel(for: .title)
                self.microCategory.text = self.populateLabel(for: .MicroCategory)
                self.editorialDescription.text = self.populateLabel(for: .EditorialDescription)
                self.macroCategory.text = self.populateLabel(for: .MacroCategory)
                
                self.imagesAvailable = productDetailViewModel.imagesUrl
                NotificationCenter.default.post(name: .saveImagesUrlAvailable, object: self)
            }
        }
    }
    
    func populateLabel(for detail: Detail) -> String {
        
        let labelInformation = productDetailViewModel?.descripriptions.filter { $0.key == detail.rawValue }.reduce("") { $0 + $1.value } ?? ""
        
        return labelInformation
    }
    
    private func setupPhotoCarousel() {
        
        scrollView.addSubview(photoCarousel)
        photoCarousel.anchor(top: scrollView.topAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: UIEdgeInsets(top: 20, left: 20, bottom: 0, right: 20), size: CGSize(width: 0, height: 425))
        
        scrollView.addSubview(photoIndicator)
        photoIndicator.anchor(top: photoCarousel.bottomAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: UIEdgeInsets(top: 10, left: 131, bottom: 0, right: 131), size: CGSize(width: 0, height: 28))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(scrollView)
        scrollView.fillSuperview()
        
        setupPhotoCarousel()
        
        setupSubViews()
        
    }
    
    func setupSubViews() {
        
        fullPrice.constrainWidth(constant: 90)
        let horizontalStack = HorizontalStackView(arrangedSubviews: [fullPrice, discountedPrice], alignment: .fill)
        
        let verticalStack = VerticalStackView(arrangedSubviews: [modelName, horizontalStack, productTitle, microCategory], spacing: 20)
        scrollView.addSubview(verticalStack)
        
        verticalStack.anchor(top: photoIndicator.bottomAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: UIEdgeInsets(top: 20, left: 20, bottom: 0, right: 20))
        
        let labels = [fullPrice, discountedPrice, modelName, productTitle, microCategory]
        labels.forEach ({
            $0.textAlignment = .left
        })
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
