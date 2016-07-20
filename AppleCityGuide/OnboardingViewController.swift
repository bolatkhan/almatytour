//
//  OnboardingViewController.swift
//  AppleCityGuide
//
//  Created by user on 04.07.16.
//  Copyright © 2016 Roborzoid. All rights reserved.
//

import UIKit

private struct Page {
    let title: String
    let subtitle: String
    let image: UIImage
}


final class OnboardingViewController: UICollectionViewController {
    private let cellIdentifier = "OnboardingCollectionViewCell"
    private let pages = [Page(title: "RUN", subtitle: "RUN FAST", image: UIImage(named: "achieve")!),
                         Page(title: "SIT", subtitle: "SIT HARD", image: UIImage(named: "Ile")!)]
    
    // MARK: - View LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let collectionViewLayout = collectionView?.collectionViewLayout
            as? UICollectionViewFlowLayout else { return }
        collectionViewLayout.itemSize = view.bounds.size
    }
    
    // MARK: - UICollectionViewDataSource
    
    override func collectionView(collectionView: UICollectionView,
                                 numberOfItemsInSection section: Int) -> Int {
        return pages.count
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(cellIdentifier, forIndexPath: indexPath) as! OnboardingCollectionViewCell
        
        let page = pages[indexPath.row]
        cell.backgroundImageView.image = page.image
        cell.titleLabel.text = page.title
        cell.subtitleLabel.text = page.subtitle
        
        return cell
    }
}
