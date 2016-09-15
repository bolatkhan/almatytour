//
//  ProfileViewController.swift
//  AppleCityGuide
//
//  Created by user on 12.07.16.
//  Copyright © 2016 Roborzoid. All rights reserved.
//

import UIKit
import FBSDKLoginKit
import FBSDKCoreKit


class ProfileViewController: UIViewController, FBSDKLoginButtonDelegate {
    
    
    let label: UILabel? = nil
    let loginButton: FBSDKLoginButton = {
        let button = FBSDKLoginButton()
        button.readPermissions = ["email"]
        return button
    }()
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.whiteColor()
        title = "Profile"
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Menu", style: .Plain, target: self, action: #selector(SSASideMenu.presentLeftMenuViewController))
        
        view.addSubview(loginButton)
        loginButton.center = view.center
        loginButton.delegate = self
        if let token = FBSDKAccessToken.currentAccessToken() {
            fetchProfile()
        }
    }
    
    func fetchProfile(){
        print("fetch profile")
    }
    
    func loginButton(loginButton: FBSDKLoginButton!, didCompleteWithResult result: FBSDKLoginManagerLoginResult!, error: NSError!) {
        print("completed login")
        fetchProfile()
    }
    func loginButtonDidLogOut(loginButton: FBSDKLoginButton!) {

    }
    func loginButtonWillLogin(loginButton: FBSDKLoginButton!) -> Bool {
        return true
    }
    
}
