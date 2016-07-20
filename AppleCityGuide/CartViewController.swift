//
//  CartViewController.swift
//  AppleCityGuide
//
//  Created by user on 24.06.16.
//  Copyright © 2016 Roborzoid. All rights reserved.
//

import UIKit
import Cosmos

class CartViewController: UIViewController {
    var tourDetail = [String: AnyObject] ()
    var tourImage: UIImage?
    
    @IBOutlet weak var tourName: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var tourTypeLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var lenghtLabel: UILabel!
    @IBOutlet weak var tourCategoryLabel: UILabel!
    @IBOutlet weak var companyNameLabel: UILabel!
    @IBOutlet weak var adressLabel: UILabel!
    @IBOutlet weak var ratingStars: CosmosView!
    
    
    var isTourFav = NSUserDefaults.standardUserDefaults().boolForKey("isTourFav")
    @IBAction func favButtonTapped(sender: UIButton) {
        if isTourFav {
            let image = UIImage(named: "like_passive.png")
            sender.setImage(image, forState: UIControlState.Normal)
        } else {
            let image = UIImage(named: "like_active.png")
            sender.setImage(image, forState: UIControlState.Normal)
        }
        
        isTourFav = !isTourFav
        NSUserDefaults.standardUserDefaults().setBool(isTourFav, forKey: "isTourFav")
        NSUserDefaults.standardUserDefaults().synchronize()
    }

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tourName.text = tourDetail["sxema"] as? String
        imageView.image = tourImage
        tourTypeLabel.text = tourDetail["peredvijenye"] as? String
        durationLabel.text = tourDetail["dlitelnost"] as? String
        lenghtLabel.text = tourDetail["dlina"] as? String
        tourCategoryLabel.text = tourDetail["kategory"] as? String
        companyNameLabel.text = tourDetail["name"] as? String
        adressLabel.text = tourDetail["contacts"] as? String
    }
}
