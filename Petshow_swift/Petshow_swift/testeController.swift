//
//  testeController.swift
//  Petshow_swift
//
//  Created by Bruno Salmito on 29/09/17.
//  Copyright © 2017 Bruno Salmito. All rights reserved.
//

import UIKit


class testeController:UIViewController{
    
    @IBOutlet var aaa: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
//        var txt:UITextField = UITextField(frame: CGRect(x: 50, y: 50, width: 100, height: 100))
//        txt.backgroundColor = UIColor.blue
//        aaa.tableFooterView?.addSubview(txt)
//        
        let customView = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
        customView.backgroundColor = UIColor.red
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
        button.setTitle("Submit", for: .normal)
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        customView.addSubview(button)
        aaa.tableFooterView = customView
        
    }
    
    func buttonAction(_ sender: UIButton!) {
        print("Button tapped")
    }
}
