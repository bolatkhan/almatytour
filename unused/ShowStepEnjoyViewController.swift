//
//  ShowStepEnjoyViewController.swift
//  AppleCityGuide
//
//  Created by user on 01.07.16.
//  Copyright © 2016 Roborzoid. All rights reserved.
//

import UIKit

class ShowStepEnjoyViewController: ShowStepViewController {

//    @IBOutlet private weak var yellowTriangle: UIImageView!
//    @IBOutlet private weak var greenTriangle: UIImageView!
//    @IBOutlet private weak var purpleTriangle: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.text = NSLocalizedString("Meet", comment: "")
        subTitleLabel.text = NSLocalizedString("Build world together", comment: "")
    }
    
//    override func viewDidAppear(animated: Bool) {
//        super.viewDidAppear(animated)
//        
//        animate(yellowTriangle, offset: 3, duration: 3)
//        animate(greenTriangle, offset: 7, duration: 2)
//        animate(purpleTriangle, offset: 5, duration: 2)
//    }

}
