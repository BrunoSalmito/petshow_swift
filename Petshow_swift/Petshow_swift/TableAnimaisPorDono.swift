//
//  TableAnimaisPorDono.swift
//  Petshow_swift
//
//  Created by Bruno Salmito on 07/10/17.
//  Copyright © 2017 Bruno Salmito. All rights reserved.
//

import UIKit

class TableAnimaisPorDono: UITableView,UITableViewDataSource, UITableViewDelegate {

    var animais:[Animal]?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.delegate = self
        self.dataSource = self
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if(animais?.count != nil){
            return (animais?.count)!
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier:"CellMarcarAnimal", for: indexPath) as! CellAnimalPost
        cell.animal = animais?[indexPath.row]
        
        
        return cell
    }

}
