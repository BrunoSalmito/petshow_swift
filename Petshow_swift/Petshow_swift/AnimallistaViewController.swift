//
//  AnimallistaViewController.swift
//  Petshow_swift
//
//  Created by Bruno Salmito on 26/09/17.
//  Copyright © 2017 Bruno Salmito. All rights reserved.
//

import UIKit

class AnimallistaViewController: UITableViewController {
    
    let cellIdentifier = "CellAnimalListaController"
    var animais = [Animal]()
    var adocao = [Adocao]()
    var perdidos = [Perdido]()
    var tableViewAux:UITableView?
    var indicadorProgress:ActivityIndicadorViewPet =  ActivityIndicadorViewPet()
    var animalSelected:Animal?
    var sections:[String] = [String]()
    


    override func numberOfSections(in tableView: UITableView) -> Int {
        var numberOfSectionsInt:Int = 0
        sections = [String]()
        if(animais.count > 0){
            sections.append("Pets")
        }
        if(adocao.count > 0){
            sections.append("Adoção")
        }
        if(perdidos.count > 0){
            sections.append("Perdidos/Achados")
        }
        
        
        print(sections.count)
        return sections.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if(sections[section] == "Pets"){
            return animais.count
        }
        if(sections[section] == "Adoção"){
            return adocao.count
        }
        if(sections[section] == "Perdidos/Achados"){
            return perdidos.count
        }
        

        return 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
//        if(indexPath.section == 0){
//            cell.textLabel?.text = animais[indexPath.row].nome?.description
//        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? CellAnimalListaController
        
        tableView.separatorStyle = UITableViewCellSeparatorStyle.singleLine
        cell?.imageAnimal.layer.cornerRadius=28.0
        cell?.imageAnimal.clipsToBounds = true
        
        
        
        // Configure Cell
        if(sections[indexPath.section] == "Pets" ){
            let animal = animais[indexPath.row]
            cell?.lblPrincipal.text = animal.nome?.description
            cell?.lblDetalhe.text = animal.raca?.description
            if (animal.fotoPerfil != nil) {
                cell?.imageAnimal.image = ImageUtil.nsString64ToImage(stringImage: animal.fotoPerfil!)
            }else{
                
            }
        }
        if(sections[indexPath.section] == "Adoção"){
            let adocao = self.adocao[indexPath.row]
            
            if(adocao.dataAdocao != nil){
                cell?.lblDetalhe.text = "Adotado"
            }else{
                cell?.lblDetalhe.text = "Aguardando adoção"
            }
            
            cell?.lblPrincipal.text = adocao.raca! as String
            if ((adocao.fotos?.count)! > 0 ) {
                cell?.imageAnimal.image = ImageUtil.nsString64ToImage(stringImage: adocao.fotos![0])
            }else{
                
            }
        }
        if(sections[indexPath.section] == "Perdidos/Achados"){
            let perdido = perdidos[indexPath.row]
            
            if(perdido.flAcontecimento == "A"){
                cell?.lblPrincipal.text = "Encontrado"
            }else{
                cell?.lblPrincipal.text = "Perdido"
            }
            
            cell?.lblDetalhe.text = perdido.raca as? String
            if ((perdido.fotos?.count)! > 0 ) {
                cell?.imageAnimal.image = ImageUtil.nsString64ToImage(stringImage: perdido.fotos![0])
            }else{
                
            }
        }
        
        return cell!
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
       
        return self.sections[section]
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        callRestListaAnimal()
    }
    
    func callRestListaAnimal(){
        self.indicadorProgress.open(self)
        DispatchQueue.main.async {
            CallRest.requestGetList(url: "animal/consulta/usuario/"+(FacebookUtil.usuarioLogado?.id?.stringValue )! ,callBack: self.preencherListaAnimal, callBackError: self.erro)
        }
    }
    
    func callRestListaAdocao(){
        
        DispatchQueue.main.async {
            CallRest.requestGetList(url: "adocao/consulta/usuario/"+(FacebookUtil.usuarioLogado?.id?.stringValue )! ,callBack: self.preencherListaAdocao, callBackError: self.erro)
        }
    }
    func callRestListaPerdidos(){
        
        DispatchQueue.main.async {
            CallRest.requestGetList(url: "animal/consulta/perdido/usuario/"+(FacebookUtil.usuarioLogado?.id?.stringValue )! ,callBack: self.preencherListaPerdidos, callBackError: self.erro)
        }
    }
    func preencherListaAnimal(json:[[String:AnyObject]]) -> Void{
        
        animais = JsonUtil.listByJson(Animal.self,json:json)
        
        DispatchQueue.main.sync {
            callRestListaAdocao()
        }
    }
    
    func preencherListaAdocao(json:[[String:AnyObject]]) -> Void{
        
        adocao = JsonUtil.listByJson(Adocao.self,json:json)
        
        DispatchQueue.main.sync {
           callRestListaPerdidos()
        }
    }
    
    func preencherListaPerdidos(json:[[String:AnyObject]]) -> Void{
        
        perdidos = JsonUtil.listByJson(Perdido.self,json:json)
        
        DispatchQueue.main.sync {
            self.tableView.reloadData()
            self.indicadorProgress.close()
        }
    }
    
    func erro(mapErro:MapErrorRetornoRest){
        ComponentsUtil.backErrorRest(mapErro:mapErro,controller:self,progress:self.indicadorProgress)
        
    }

}
