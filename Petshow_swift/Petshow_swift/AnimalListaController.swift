//
//  AnimalLista.swift
//  Petshow_swift
//
//  Created by Bruno Salmito on 01/09/17.
//  Copyright © 2017 Bruno Salmito. All rights reserved.
//

import UIKit

class AnimalListaController:UIViewController, UITableViewDataSource, UITableViewDelegate {

    
    let cellIdentifier = "CellAnimalLista"
    var animais = [Animal]()
    var adocao = [Adocao]()
    var perdidos = [Perdido]()
    var tableViewAux:UITableView?
    
    var animalSelected:Animal?
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        
         CallRest.requestGetList(url: "animal/consulta/usuario/"+(FacebookUtil.usuarioLogado?.id?.stringValue )! ,callBack: self.preencherLista, callBackError: self.erroLista)
            
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
       
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let numberOfRows = animais.count
        tableViewAux = tableView
        return numberOfRows
    }
    //    set as linhas
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? CellAnimalLista  else {
            fatalError("The dequeued cell is not an instance of MealTableViewCell.")
        }
        tableView.separatorStyle = UITableViewCellSeparatorStyle.singleLine
        cell.imageAnimal.layer.cornerRadius=35.0
        cell.imageAnimal.clipsToBounds = true
        
        
        
        // Configure Cell
        if(animais.count > 0 ){
            let animal = animais[indexPath.row]
            cell.lblNome.text = animal.nome?.description
            cell.lblRaca.text = animal.raca?.description
            if (animal.fotoPerfil != nil) {
                cell.imageAnimal.image = ImageUtil.nsString64ToImage(stringImage: animal.fotoPerfil!)
            }else{
                
            }
        }
        if(adocao.count > 0){
            let adocao = self.adocao[indexPath.row]
            
            if(adocao.dataAdocao != nil){
                cell.lblNome.text = "Adotado"
            }else{
                cell.lblNome.text = "Aguardando adoção"
            }
          
            cell.lblRaca.text = adocao.raca! as String
            if ((adocao.fotos?.count)! > 0 ) {
                cell.imageAnimal.image = ImageUtil.nsString64ToImage(stringImage: adocao.fotos![0])
            }else{
                
            }
        }
        if(perdidos.count > 0){
            let perdido = perdidos[indexPath.row]
            
            if(perdido.flAcontecimento == "A"){
                cell.lblNome.text = "Encontrado"
            }else{
                cell.lblNome.text = "Perdido"
            }
            
            cell.lblRaca.text = perdido.raca as? String
            if ((perdido.fotos?.count)! > 0 ) {
                cell.imageAnimal.image = ImageUtil.nsString64ToImage(stringImage: perdido.fotos![0])
            }else{
                
            }
        }
        

    
        return cell
    }

    //click
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let indexPath = tableView.indexPathForSelectedRow
        self.animalSelected = animais[(indexPath?.row)!]
        self.performSegue(withIdentifier: "segueByGridAnimalList", sender:self)
       
    }

    func preencherLista(json:[[String:AnyObject]]) -> Void{
        for item in json{
            let novoItem = Animal()
            novoItem.setValuesForKeys(item)
            animais.append(novoItem)
        }
        
        DispatchQueue.main.sync {
            self.tableViewAux?.reloadData()
        }
    }
    
    func erroLista(mapErro:MapErrorRetornoRest){
        print("erro chamada")
        print("erro chamada")
        
    }
    


    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueByGridAnimalList" {
            let controller =  (segue.destination as? UINavigationController)?.topViewController as? EdtAnimalController
            controller?.animal = animalSelected
        }
      
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //callRestListVacina()
    }
}
