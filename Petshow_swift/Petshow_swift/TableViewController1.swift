//
//  TableViewController1.swift
//  Petshow_swift
//
//  Created by Bruno Salmito on 29/09/17.
//  Copyright © 2017 Bruno Salmito. All rights reserved.
//

import UIKit

class TableViewController1: UIViewController {

    @IBOutlet var aaa: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
//        let customView = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
//        customView.backgroundColor = UIColor.red
//        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
//        button.setTitle("Submit", for: .normal)
//        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
//        
//        let buttonaa = UITextField(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
//        customView.addSubview(buttonaa)
//        aaa.tableFooterView = customView
        
    }
    
    func buttonAction(_ sender: UIButton!) {
        print("Button tapped")
    }
  
}
