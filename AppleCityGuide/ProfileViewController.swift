//
//  ProfileViewController.swift
//  AppleCityGuide
//
//  Created by user on 12.07.16.
//  Copyright © 2016 Roborzoid. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.whiteColor()
        
        title = "Profile"
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Menu", style: .Plain, target: self, action: #selector(SSASideMenu.presentLeftMenuViewController))
       
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
