//
//  MenuEdtAnimalController.swift
//  Petshow_swift
//
//  Created by Bruno Salmito on 13/09/17.
//  Copyright © 2017 Bruno Salmito. All rights reserved.
//


import UIKit

class MenuEdtAnimalController:UIViewController, UITableViewDataSource, UITableViewDelegate  {
    @IBOutlet weak var table: UITableView!
    let cellIdentifier = "CellMenuEdAnimal"
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let numberOfRows = 3
        
        return numberOfRows
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? CellMenuEdAnimal  else {
            fatalError("The dequeued cell is not an instance of MealTableViewCell.")
        }
        tableView.separatorStyle = UITableViewCellSeparatorStyle.singleLine
//        cell.imageAnimal.layer.cornerRadius=35.0
//        cell.imageAnimal.clipsToBounds = true
        
        
        
        
        return cell
    }
}
