//
//  ViewController.swift
//  StellaMcCartney
//
//  Created by Vinicius Leal on 26/08/19.
//  Copyright © 2019 Vinicius Leal. All rights reserved.
//

import UIKit

struct Department {
    let name: String
    let imageUrl: String
}

class MainDepartmentsViewController: UICollectionViewController {

    var lingerie: ProductLingerie?
    var acessory: ProductAccessory?
    var readyToWear: ProductReadyToWear?
    var beauty: ProductBeauty?

    func fetchDepartmentsInformation() {
        
        Service.shared.fetchMainLingerie(urlString: SearchAPI.lingerie) { (res) in
            switch res {
            case .success(let lingerie):
                self.lingerie = lingerie
            case .failure(let err):
                print("Failure to fetch lingerie:", err)
            }
        }
        
        Service.shared.fetchMainAccessory(urlString: SearchAPI.accessories) { (res) in
            switch res {
            case .success(let accessory):
                self.acessory = accessory
            case .failure(let err):
                print("Failure to fetch lingerie:", err)
            }
        }
        
        Service.shared.fetchMainReadyToWear(urlString: SearchAPI.readyToWear) { (res) in
            switch res {
            case .success(let readyToWear):
                self.readyToWear = readyToWear
            case .failure(let err):
                print("Failure to fetch lingerie:", err)
            }
        }
        
        Service.shared.fetchMainBeauty(urlString: SearchAPI.beauty) { (res) in
            switch res {
            case .success(let beauty):
                self.beauty = beauty
            case .failure(let err):
                print("Failure to fetch lingerie:", err)
            }
            
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
    
    let cellId = "cellId"
    
    var mainDepartments = [Department]()
    
    init() {
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchDepartmentsInformation()
        collectionView.backgroundColor = .green
        collectionView.register(MainDepartmentCell.self, forCellWithReuseIdentifier: cellId)
        
        mainDepartments = [Department(name: "Ready to wear", imageUrl: ImageUrl.readyToWear),
                           Department(name: "Accessories", imageUrl: ImageUrl.accessories),
                           Department(name: "Beauty", imageUrl: ImageUrl.beauty),
                           Department(name: "Lingerie", imageUrl: ImageUrl.lingerie)]
    }
}

extension MainDepartmentsViewController: UICollectionViewDelegateFlowLayout {
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return mainDepartments.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (view.frame.width - 40), height: (view.frame.height / 4))
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! MainDepartmentCell
        
        let department = mainDepartments[indexPath.item]
        
        cell.item = department
        return cell
    }
    
}


