//
//  ShowStepAchieveViewController.swift
//  AppleCityGuide
//
//  Created by user on 01.07.16.
//  Copyright © 2016 Roborzoid. All rights reserved.
//

import UIKit

class ShowStepAchieveViewController: ShowStepViewController {
//
//    @IBOutlet private weak var camera: UIImageView!
//    @IBOutlet private weak var pen: UIImageView!
//    @IBOutlet private weak var book: UIImageView!
//    @IBOutlet private weak var controller: UIImageView!
//    @IBOutlet private weak var keyboard: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.text = NSLocalizedString("Match", comment: "")
        subTitleLabel.text = NSLocalizedString("Match friends with your skills", comment: "")
    }
    
//    override func viewDidAppear(animated: Bool) {
//        super.viewDidAppear(animated)
//        
//        animate(camera, offset: 10, duration: 4)
//        animate(pen, offset: 5, duration: 5)
//        animate(book, offset: 10, duration: 3)
//        animate(controller, offset: 15, duration: 2)
//        animate(keyboard, offset: 20, duration: 4)
//    }

}
