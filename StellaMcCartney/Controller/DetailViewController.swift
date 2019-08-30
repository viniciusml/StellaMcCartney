//
//  DetailViewController.swift
//  StellaMcCartney
//
//  Created by Vinicius Leal on 27/08/19.
//  Copyright © 2019 Vinicius Leal. All rights reserved.
//

import Foundation
import UIKit

class DetailViewController: UIViewController, UIScrollViewDelegate {
    
    let scrollView: UIScrollView = {
        let sView = UIScrollView()
        sView.backgroundColor = .white
        return sView
    }()
    
    var productDetailViewModel: ProductDetailViewModel?
    
    let productTitle = UILabel(font: UIFont(name: Font.medium, size: 18)!)
    
    let microCategory = UILabel(font: UIFont(name: Font.regular, size: 16)!)
    
    let fullPrice = UILabel(font: UIFont(name: Font.medium, size: 18)!)
    
    let discountedPrice = UILabel(font: UIFont(name: Font.thin, size: 18)!)
    
    let modelName = UILabel(font: UIFont(name: Font.semibold, size: 20)!, numberOfLines: 0)
    
    let editorialDescription = UILabel(font: UIFont(name: Font.regular, size: 18)!, numberOfLines: 0)
    
    let macroCategory = UILabel(font: UIFont(name: Font.regular, size: 16)!)
    
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
                
                self.modelName.text = productDetailViewModel.modelNames
                self.productTitle.text = productDetailViewModel.productTitle
                self.microCategory.text = productDetailViewModel.microCategory
                self.editorialDescription.text = productDetailViewModel.editorialDescription
                
                self.macroCategory.text = productDetailViewModel.macroCategory
                
                self.imagesAvailable = productDetailViewModel.imagesUrl
                NotificationCenter.default.post(name: .saveImagesUrlAvailable, object: self)
                
            }
        }
    }
    
    private func setupPhotoCarousel() {
        
        scrollView.addSubview(photoCarousel)
        photoCarousel.anchor(top: scrollView.topAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: UIEdgeInsets(top: 20, left: 20, bottom: 0, right: 20), size: CGSize(width: 0, height: 425))
        
        scrollView.addSubview(photoIndicator)
        photoIndicator.anchor(top: photoCarousel.bottomAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: UIEdgeInsets(top: 10, left: 131, bottom: 0, right: 131), size: CGSize(width: 0, height: 28))
        
    }
    
    var contentRect = CGRect.zero
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(scrollView)
        scrollView.delegate = self
        scrollView.fillSuperview()
        
        setupPhotoCarousel()
        
        setupSubViews()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        self.scrollView.contentSize = self.scrollView.subviews.reduce(CGRect.zero, {
            return $0.union($1.frame)
        }).size
        
    }
    
    func setupSubViews() {
        
        fullPrice.constrainWidth(constant: 140)
        let horizontalStack = HorizontalStackView(arrangedSubviews: [fullPrice, discountedPrice], alignment: .fill)
        
        let verticalStack = VerticalStackView(arrangedSubviews: [modelName, horizontalStack, productTitle, microCategory, macroCategory, editorialDescription], spacing: 20)
        scrollView.addSubview(verticalStack)
        
        verticalStack.anchor(top: photoIndicator.bottomAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: UIEdgeInsets(top: 20, left: 20, bottom: 0, right: 20))
        
        let labels = [fullPrice, discountedPrice, modelName, productTitle, microCategory, macroCategory, editorialDescription]
        labels.forEach ({
            $0.textAlignment = .left
            $0.lineBreakMode = .byWordWrapping
        })
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

