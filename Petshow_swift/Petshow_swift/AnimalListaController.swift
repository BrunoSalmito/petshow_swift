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
    var tableViewAux:UITableView?
    
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
        // Fetch Fruit
        let animal = animais[indexPath.row]
        
        // Configure Cell
        
        cell.lblNome.text = animal.nome as! String
        cell.lblRaca.text = animal.raca as! String
        if (animal.fotoPerfil != nil) {
            cell.imageAnimal.image = ImageUtil.nsString64ToImage(stringImage: animal.fotoPerfil!)
        }else{
            
        }
        
        return cell
    }
    
    //click
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let indexPath = tableView.indexPathForSelectedRow
        let currentCell = tableView.cellForRow(at: indexPath!)!
      //  print(currentCell.textLabel!.text!)
        
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

}
