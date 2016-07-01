//
//  CartViewController.swift
//  AppleCityGuide
//
//  Created by user on 24.06.16.
//  Copyright © 2016 Roborzoid. All rights reserved.
//

import UIKit

class CartViewController: UIViewController {

    
    var tourDetail = [String: AnyObject] ()
    
    @IBOutlet weak var tourName: UILabel!
    
    @IBOutlet weak var imageView: UIImageView!
    
  
    @IBOutlet weak var tourTypeLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var lenghtLabel: UILabel!
    @IBOutlet weak var tourCategoryLabel: UILabel!
    @IBOutlet weak var companyNameLabel: UILabel!
    @IBOutlet weak var adressLabel: UILabel!
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

}
