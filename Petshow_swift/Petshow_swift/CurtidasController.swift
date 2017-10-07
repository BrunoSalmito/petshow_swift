//
//  CurtidasController.swift
//  Petshow_swift
//
//  Created by Bruno Salmito on 04/10/17.
//  Copyright © 2017 Bruno Salmito. All rights reserved.
//

import UIKit

class CurtidasController:UITableViewController{
    var post:Postagem?
    var likesResponse = [LikesResponses]()
    
    var cellIdentifier:String = "cellCurtidasController"
    
    var indicadorProgress:ActivityIndicadorViewPet =  ActivityIndicadorViewPet()
    
    override func viewDidLoad() {
        // ver erro didwillapear chamando duas vezes o callRest
        super.viewDidLoad()
        callRestListLikes()
        self.tableView.tableFooterView = UIView()
        
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        let numberOfRows = likesResponse.count
        return numberOfRows
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? CellCurtidas
        cell?.like = likesResponse[indexPath.row]
        
        return cell!
    }
   
    
    
    func callRestListLikes(){
        Banco.criarLikesResponse()
        likesResponse = Banco.likesResponses!
//        self.indicadorProgress.open(self)
//        DispatchQueue.main.async {
//            CallRest.requestGetList(url: "animal/tratamento/animal/".appending((self.animal?.id?.description)!)   ,callBack: self.preencherLista, callBackError: self.erro)
//        }
    }
    
    
    func preencherLista(json:[[String:AnyObject]]) -> Void{
        
        likesResponse = JsonUtil.listByJsonResponseMap(LikesResponses.self,json:json)
        
        DispatchQueue.main.sync {
            self.tableView.reloadData()
            self.indicadorProgress.close()
        }
    }
    
    func erro(mapErro:MapErrorRetornoRest){
        ComponentsUtil.backErrorRest(mapErro:mapErro,controller:self,progress:self.indicadorProgress)
        
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        callRestListLikes()
    }
    
}
