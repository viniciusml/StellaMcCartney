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
    
    // MARK: - Properties
    
    var imagesAvailable = [String]()
    
    var productDetailViewModel: ProductDetailViewModel?
    
    // MARK: - UI Elements
    
    let scrollView: UIScrollView = {
        let sView = UIScrollView()
        sView.backgroundColor = .white
        return sView
    }()
    
    let productTitle = UILabel(font: UIFont(name: Font.medium, size: 18)!)
    
    let microCategory = UILabel(font: UIFont(name: Font.regular, size: 16)!)
    
    let firstPrice = UILabel(font: UIFont(name: Font.medium, size: 18)!)
    
    let secondPrice = UILabel(font: UIFont(name: Font.thin, size: 18)!)
    
    let modelName = UILabel(font: UIFont(name: Font.semibold, size: 20)!, numberOfLines: 0)
    
    let editorialDescription = UILabel(font: UIFont(name: Font.regular, size: 18)!, numberOfLines: 0)
    
    let macroCategory = UILabel(font: UIFont(name: Font.regular, size: 16)!)
    
    let photoCarousel = PhotoCarousel()
    
    let photoIndicator = PhotoIndicator()
    
    // MARK: - Initializer
    
    init(productCode8: String) {
        super.init(nibName: nil, bundle: nil)
        
        fetchProductDetail(code8: productCode8)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - View Controller Life Cycle
    
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
    
    // MARK: - API
    
    func fetchProductDetail(code8: String) {
        
        Service.shared.fetchProductDetail(code8: code8) { (res) in
            switch res {
            case .success(let productDetail):
                self.productDetailViewModel = ProductDetailViewModel(product: productDetail)
            case .failure(let err):
                print("Failure to fetch details:", err)
            }
            
            DispatchQueue.main.async {
                self.loadData()
            }
        }
    }
    
    // MARK: - Helper Functions
    
    func setupPhotoCarousel() {
        
        scrollView.addSubview(photoCarousel)
        photoCarousel.anchor(top: scrollView.topAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: UIEdgeInsets(top: 20, left: 20, bottom: 0, right: 20), size: CGSize(width: 0, height: 425))
        
        scrollView.addSubview(photoIndicator)
        photoIndicator.anchor(top: photoCarousel.bottomAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: UIEdgeInsets(top: 10, left: 131, bottom: 0, right: 131), size: CGSize(width: 0, height: 28))
        
    }
    
    func setupSubViews() {
        
        firstPrice.constrainWidth(constant: 140)
        let horizontalStack = HorizontalStackView(arrangedSubviews: [firstPrice, secondPrice], alignment: .fill)
        
        let verticalStack = VerticalStackView(arrangedSubviews: [modelName, horizontalStack, productTitle, microCategory, macroCategory, editorialDescription], spacing: 20)
        scrollView.addSubview(verticalStack)
        
        verticalStack.anchor(top: photoIndicator.bottomAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: UIEdgeInsets(top: 20, left: 20, bottom: 0, right: 20))
        
        let labels = [firstPrice, secondPrice, modelName, productTitle, microCategory, macroCategory, editorialDescription]
        
        labels.forEach ({
            $0.textAlignment = .left
            $0.lineBreakMode = .byWordWrapping
        })
    
    }
    
    func loadData() {
        guard let productDVM = self.productDetailViewModel else { return }
        
        firstPrice.text = String(describing: productDVM.fullPrice)
        secondPrice.text = String(describing: productDVM.discountPrice)
        modelName.text = productDVM.modelNames
        productTitle.text = productDVM.productTitle
        microCategory.text = productDVM.microCategory
        editorialDescription.text = productDVM.editorialDescription
        macroCategory.text = productDVM.macroCategory
        
        imagesAvailable = productDVM.imagesUrl
        NotificationCenter.default.post(name: .saveImagesUrlAvailable, object: self)
        
    }

}

