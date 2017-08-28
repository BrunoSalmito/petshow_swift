//
//  ViewController.swift
//  Petshow
//
//  Created by Bruno Salmito on 16/06/17.
//  Copyright © 2017 Bruno Salmito. All rights reserved.
//

import UIKit
import FacebookLogin
import FacebookCore
import FacebookShare
import FBSDKCoreKit
import FBSDKLoginKit
import FBSDKShareKit

class ViewController: UIViewController,LoginButtonDelegate{

    override func viewDidLoad() {
        super.viewDidLoad()
    
        print("iniciando")
       
        if AccessToken.current != nil{
            FacebookUtil(viewController: self).loadProfileFacebook()
          
        }else{
       
        }
        let loginButton = LoginButton(readPermissions: [ .publicProfile, .email, .userFriends ])
        loginButton.center = view.center
        loginButton.delegate = self
        view.addSubview(loginButton)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func loginButtonDidCompleteLogin(_ loginButton: LoginButton, result: LoginResult) {
        
        
        switch result {
        case .failed(let error):
            print(error)
        case .cancelled:
            print("User cancelled login.")
        case .success(let grantedPermissions, let declinedPermissions, let accessToken):
            print("Logged in!")
            FacebookUtil(viewController: self).loadProfileFacebook()
         }
        
        
    }
    func loginButtonDidLogOut(_ loginButton: LoginButton) {
        print("Logged Out")
    }


}

