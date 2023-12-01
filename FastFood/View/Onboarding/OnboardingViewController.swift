//
//  OnboardingViewController.swift
//  FastFood
//
//  Created by Xcaret Mora on 30/11/23.
//

import UIKit

class OnboardingViewController: UIViewController {

    @IBOutlet weak var nextCollectionViewButton: UIButton!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageController: UIPageControl!
    
    var slides: [OnboardingSlide] = []
    var currentPage = 0 {
        didSet {
            pageController.currentPage = currentPage
            if currentPage == slides.count-1 {
                nextCollectionViewButton.setTitle("Get Started", for: .normal)
            } else {
                nextCollectionViewButton.setTitle("Next", for: .normal)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        
        slides = [
            OnboardingSlide(title: "Delicious Chewy", description: "Food needs to be chewed a lot before swallowing, usually not a pleasant experience", image: UIImage(named: "slide1")!),
            OnboardingSlide(title: "Flavoring", description: "seasoning, anything added to food for the flavor it imparts or the act of adding flavor to food.", image: UIImage(named: "slide2")!),
            OnboardingSlide(title: "Gustatory", description: "relating to the sense of taste, to the sensation in the taste buds", image: UIImage(named: "slide3")!)
        ]

    }

    @IBAction func nextButtonClicked(_ sender: UIButton) {
        
        if currentPage == slides.count-1 {
            let controller = storyboard?.instantiateViewController(identifier: "HomeNV") as! UINavigationController
            controller.modalPresentationStyle = .fullScreen
            controller.modalTransitionStyle = .flipHorizontal
            present(controller, animated: true, completion: nil)
        } else {
            currentPage += 1
            let indexPath = IndexPath(item: currentPage, section: 0)
            collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        }
        
    }
    // MARK: - SetupWork
    func setupView() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }
}

    // MARK: - UICollectionViewDelegate
extension OnboardingViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return slides.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OnboardingCollectionViewCell.identifier, for: indexPath) as! OnboardingCollectionViewCell
        let slide = slides[indexPath.row]
        cell.slide = slide
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = scrollView.frame.width
        currentPage = Int(scrollView.contentOffset.x / width)
    }
}
