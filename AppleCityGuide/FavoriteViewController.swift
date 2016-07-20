//
//  FavoriteViewController.swift
//  AppleCityGuide
//
//  Created by user on 12.07.16.
//  Copyright © 2016 Roborzoid. All rights reserved.
//

import UIKit

class FavoriteViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.whiteColor()
        title = "Favorites"
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Menu", style: .Plain, target: self, action: #selector(SSASideMenu.presentLeftMenuViewController))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Filter", style: .Plain, target: self, action: #selector(SSASideMenu.presentRightMenuViewController))

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
