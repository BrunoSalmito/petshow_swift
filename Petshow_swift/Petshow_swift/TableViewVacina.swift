//
//  tableViewVacina.swift
//  Petshow_swift
//
//  Created by Bruno Salmito on 23/09/17.
//  Copyright © 2017 Bruno Salmito. All rights reserved.
//

import UIKit

class TableViewVacina:UITableView{
    
    func prepare(){
        let headerVi = UIView()
        headerVi.backgroundColor = UIColor.blue
        self.tableHeaderView = headerVi
    }
    

}
