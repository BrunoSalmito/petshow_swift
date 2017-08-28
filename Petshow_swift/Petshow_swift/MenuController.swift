//
//  MenuController.swift
//  Petshow
//
//  Created by Bruno Salmito on 12/07/17.
//  Copyright © 2017 Bruno Salmito. All rights reserved.
//

import UIKit
import FacebookLogin
import FacebookCore
import FacebookShare
import FBSDKCoreKit
import FBSDKLoginKit
import FBSDKShareKit

class MenuController: UIViewController {
    
    
    @IBOutlet weak var edtPerfilBtn: UIButton!
   
    @IBOutlet weak var meusPetsBtn: UIButton!
    
    @IBOutlet weak var amigosbtn: UIButton!
   
    @IBOutlet weak var adocaoBtn: UIButton!
    
    @IBOutlet weak var achadosPerdidosBtn: UIButton!
    
    @IBOutlet weak var adestramentoBTN: UIButton!
    
    @IBOutlet weak var sairBTN: UIButton!
    
    @IBOutlet weak var lblNomeUsuario: UILabel!
    
    @IBOutlet weak var imageProfile: UIImageView!
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        edtButton.backgroundColor = .clear
//        edtButton.layer.cornerRadius = 7
//        edtButton.layer.borderWidth = 1
//        edtButton.layer.borderColor = UIColor.black.cgColor
//        edtButton.tex
        
        configureButton(button:edtPerfilBtn)
        configureButton(button:meusPetsBtn)
        configureButton(button:amigosbtn)
        configureButton(button:adocaoBtn)
        configureButton(button:achadosPerdidosBtn)
        configureButton(button:adestramentoBTN)
        configureButton(button:sairBTN)
        lblNomeUsuario.text = FacebookUtil.usuarioLogado?.nome as! String
       
        imageProfile.image = ImageUtil.nsString64ToImage(stringImage: FacebookUtil.usuarioLogado!.foto!)
        self.navigationController?.navigationItem.backBarButtonItem?.isEnabled = false
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func configureButton(button:UIButton){
      
        button.layer.cornerRadius = 7
        //button.layer.borderWidth = 0
       // button.layer.borderColor = UIColor.clear as! CGColor
        button.setTitleColor(UIColor.white, for: UIControlState.normal)
        button.backgroundColor = UIColorUtil.init(hex: ParametrosUtil.Color.verdeFundoPet)
       // button.
    }
 
    
    @IBAction func logout(_ sender: Any) {
        let loginManager = FBSDKLoginManager()
        loginManager.logOut()
        self.performSegue(withIdentifier: "segueLogout", sender:self)
    }
    
    
    
}
