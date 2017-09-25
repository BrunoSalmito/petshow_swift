//
//  ActivityIndicadorViewPet.swift
//  Petshow_swift
//
//  Created by Bruno Salmito on 23/09/17.
//  Copyright © 2017 Bruno Salmito. All rights reserved.
//

import UIKit

class ActivityIndicadorViewPet:UIActivityIndicatorView{

    var activityIndicator = UIActivityIndicatorView()
    var strLabel = UILabel()
    let effectView = UIVisualEffectView(effect: UIBlurEffect(style: .dark))
    
    
    func open(_ controller:UIViewController) {
        open("Carregando", controller:controller)
    }
    
    func open(_ title: String, controller:UIViewController) {
        
        strLabel.removeFromSuperview()
        activityIndicator.removeFromSuperview()
        effectView.removeFromSuperview()
        
        strLabel = UILabel(frame: CGRect(x: 50, y: 0, width: 160, height: 46))
        strLabel.text = title + "  "
        strLabel.font = UIFont.systemFont(ofSize: 14, weight: UIFontWeightMedium)
        strLabel.textColor = UIColor(white: 0.9, alpha: 0.7)
        
        effectView.frame = CGRect(x: (controller.view.frame.midX) - strLabel.frame.width/2, y: (controller.view.frame.midY) - strLabel.frame.height/2 , width: 160, height: 46)
        effectView.layer.cornerRadius = 15
        effectView.layer.masksToBounds = true
        
        activityIndicator = UIActivityIndicatorView(activityIndicatorStyle: .white)
        activityIndicator.frame = CGRect(x: 0, y: 0, width: 46, height: 46)
        activityIndicator.startAnimating()
        
        effectView.addSubview(activityIndicator)
        effectView.addSubview(strLabel)
        controller.view.addSubview(effectView)
        UIApplication.shared.beginIgnoringInteractionEvents()
    }
    
    func close() {
        self.effectView.removeFromSuperview()
        UIApplication.shared.endIgnoringInteractionEvents()
    }


    
}
