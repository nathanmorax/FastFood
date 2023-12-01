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
    
    var populars: [Dish] = [
        .init(id: "1", name: "Chilaquiles", description: "This popular traditional breakfast dish features lightly fried corn tortillas cut into quarters and topped with green or red salsa (the red is slightly spicier).", image: "https://upload.wikimedia.org/wikipedia/commons/thumb/6/6a/Flag_of_the_Repubblica_Cisalpina.svg/180px-Flag_of_the_Repubblica_Cisalpina.svg.png", calories: 74),
        .init(id: "2", name: "Pozole", description: "According to anthropologists, this pre-Hispanic soup was once used as part of ritual sacrifices.", image: "https://upload.wikimedia.org/wikipedia/commons/thumb/6/6a/Flag_of_the_Repubblica_Cisalpina.svg/180px-Flag_of_the_Repubblica_Cisalpina.svg.png", calories: 95),
        .init(id: "1", name: "Chilaquiles", description: "This popular traditional breakfast dish features lightly fried corn tortillas cut into quarters and topped with green or red salsa (the red is slightly spicier).", image: "https://upload.wikimedia.org/wikipedia/commons/thumb/6/6a/Flag_of_the_Repubblica_Cisalpina.svg/180px-Flag_of_the_Repubblica_Cisalpina.svg.png", calories: 50),
        .init(id: "2", name: "Pozole", description: "According to anthropologists, this pre-Hispanic soup was once used as part of ritual sacrifices.", image: "https://upload.wikimedia.org/wikipedia/commons/thumb/6/6a/Flag_of_the_Repubblica_Cisalpina.svg/180px-Flag_of_the_Repubblica_Cisalpina.svg.png", calories: 18),
        .init(id: "1", name: "Chilaquiles", description: "This popular traditional breakfast dish features lightly fried corn tortillas cut into quarters and topped with green or red salsa (the red is slightly spicier).", image: "https://upload.wikimedia.org/wikipedia/commons/thumb/6/6a/Flag_of_the_Repubblica_Cisalpina.svg/180px-Flag_of_the_Repubblica_Cisalpina.svg.png", calories: 74),
        .init(id: "2", name: "Pozole", description: "According to anthropologists, this pre-Hispanic soup was once used as part of ritual sacrifices.", image: "https://upload.wikimedia.org/wikipedia/commons/thumb/6/6a/Flag_of_the_Repubblica_Cisalpina.svg/180px-Flag_of_the_Repubblica_Cisalpina.svg.png", calories: 95)
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
        categoryCollectionView.register(UINib(nibName: CategoryCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: CategoryCollectionViewCell.identifier)
        pupularCollectionView.register(UINib(nibName: DishPortraitCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: DishPortraitCollectionViewCell.identifier)
    }
}
extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        switch collectionView {
        case categoryCollectionView: 
            return categories.count
        case pupularCollectionView: 
            return populars.count
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch collectionView {
        case categoryCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.identifier, for: indexPath) as! CategoryCollectionViewCell
            let categorie = categories[indexPath.row]
            cell.category = categorie
            return cell
        case pupularCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DishPortraitCollectionViewCell.identifier, for: indexPath) as! DishPortraitCollectionViewCell
            let dish = populars[indexPath.row]
            cell.dish = dish
            return cell
        default:
            return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    }
    
}
