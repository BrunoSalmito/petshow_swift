//
//  CustomTabBarController.swift
//  Petshow
//
//  Created by Bruno Salmito on 10/07/17.
//  Copyright © 2017 Bruno Salmito. All rights reserved.
//

import UIKit
class CustomTabBarController: UITabBarController {
    
    override func viewDidLoad() {
       //self.tabBar.isHidden = true
        
        self.tabBar.backgroundColor = UIColor.black// UIColorUtil.init(hex: ParametrosUtil.Color.verdeFundoPet)
        self.tabBar.barTintColor =  UIColorUtil.init(hex: "A2C6AF")
        self.tabBar.tintColor = UIColor.black
        var itensTab:[UITabBarItem]  = self.tabBar.items!
        
        //Pendente: descobrir resolucao correta das imagens
        
        itensTab[0].title = "Publicações"
        itensTab[0].image = UIImage.init(named: "ic_burst_mode_hdpi.png")
     
        
        itensTab[1].title = "Pets"
        itensTab[1].image = UIImage.init(named: "ic_cat_hdpi.png")
        
        itensTab[2].title = "Mensagens"
        itensTab[2].image = UIImage.init(named: "ic_message_hdpi.png")
 
        itensTab[3].title = "Alerta"
        itensTab[3].image = UIImage.init(named: "ic_alert_circle_hdpi.png")
        
        itensTab[4].title = "Menu"
        itensTab[4].image = UIImage.init(named: "ic_menu_hdpi.png")
    }
}
