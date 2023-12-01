//
//  HomeViewController.swift
//  FastFood
//
//  Created by Xcaret Mora on 30/11/23.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var categoryCollectionView: UICollectionView!
    @IBOutlet weak var pupularCollectionView: UICollectionView!
    
    var categories: [DishCategory] = [
        .init(id: "1", name: "Mexican dish", image: "https://upload.wikimedia.org/wikipedia/commons/thumb/1/1b/Zeng_Liansong%27s_proposal_for_the_PRC_flag.svg/220px-Zeng_Liansong%27s_proposal_for_the_PRC_flag.svg.png"),
        .init(id: "2", name: "Chinese dish", image: "https://upload.wikimedia.org/wikipedia/commons/thumb/1/1b/Zeng_Liansong%27s_proposal_for_the_PRC_flag.svg/220px-Zeng_Liansong%27s_proposal_for_the_PRC_flag.svg.png"),
        .init(id: "3", name: "Italian dish", image: "https://upload.wikimedia.org/wikipedia/commons/thumb/6/6a/Flag_of_the_Repubblica_Cisalpina.svg/180px-Flag_of_the_Repubblica_Cisalpina.svg.png"),
        .init(id: "4", name: "French dish", image: "https://upload.wikimedia.org/wikipedia/commons/thumb/6/6a/Flag_of_the_Repubblica_Cisalpina.svg/180px-Flag_of_the_Repubblica_Cisalpina.svg.png"),
        .init(id: "3", name: "Italian dish", image: "https://upload.wikimedia.org/wikipedia/commons/thumb/6/6a/Flag_of_the_Repubblica_Cisalpina.svg/180px-Flag_of_the_Repubblica_Cisalpina.svg.png"),
        .init(id: "4", name: "French dish", image: "https://upload.wikimedia.org/wikipedia/commons/thumb/6/6a/Flag_of_the_Repubblica_Cisalpina.svg/180px-Flag_of_the_Repubblica_Cisalpina.svg.png")
 
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
      
        
    }
    
    private func setupView() {
        title =  "Fast Food"
        categoryCollectionView.dataSource = self
        categoryCollectionView.delegate = self
        registerCell()
    }
    
    private func registerCell() {
        categoryCollectionView.register(UINib(nibName: CategoryCollectionViewCell.indetifier, bundle: nil), forCellWithReuseIdentifier: CategoryCollectionViewCell.indetifier)
        pupularCollectionView.register(UINib(nibName: CategoryCollectionViewCell.indetifier, bundle: nil), forCellWithReuseIdentifier: CategoryCollectionViewCell.indetifier)
    }
}
extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.indetifier, for: indexPath) as! CategoryCollectionViewCell
        let categorie = categories[indexPath.row]
        cell.category = categorie
        return cell
    }
    
}
