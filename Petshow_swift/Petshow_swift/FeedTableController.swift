//
//  FeedTableController.swift
//  Petshow_swift
//
//  Created by Bruno Salmito on 29/09/17.
//  Copyright © 2017 Bruno Salmito. All rights reserved.
//

import UIKit

class FeedTableController: UITableViewController {

    var postagens: [Postagem]?
    
    
    @IBOutlet var buttonPostagem: BarButtonPickerImage!
    
    struct dataTableFeed {
        static let feedCell = "feedCell"
        static let feedHeaderCell = "feedHeaderCell"
        static let feedHeaderHeight: CGFloat = 72
        static let feedCellDefaultHeight: CGFloat = 554
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.fetchFeed()
        buttonPostagem.prepare(controller: self)
        tableView.estimatedRowHeight = dataTableFeed.feedCellDefaultHeight
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.separatorColor = UIColor.clear
        
        
         navigationController?.navigationBar.barTintColor = UIColorUtil.init(hex: "A2C6AF")
        
        let titleDict: NSDictionary = [NSForegroundColorAttributeName: UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = titleDict as! [String : Any]
        //navigationController?.navigationBar.tintColor = UIColor.white
    }
    
    func fetchFeed()
    {
        self.postagens = Postagem.criarPostagensTeste()
        self.tableView.reloadData()
    }
}

extension FeedTableController
{
    override func numberOfSections(in tableView: UITableView) -> Int {
        if let postagens = postagens {
            return postagens.count
        }
        
        return 0
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let _ = postagens {
            return 1
        } else {
            return 0
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: dataTableFeed.feedCell, for: indexPath) as! FeedCell
       
        cell.postagem = self.postagens?[indexPath.section]
        cell.selectionStyle = .none
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView?
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: dataTableFeed.feedHeaderCell) as! FeedHeaderCell
        
        cell.postagem = self.postagens?[section]
        cell.backgroundColor = UIColor.white
       
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return dataTableFeed.feedHeaderHeight
    }
    
    

}
