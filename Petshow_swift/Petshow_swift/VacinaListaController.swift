//
//  VacinaListaController.swift
//  Petshow_swift
//
//  Created by Bruno Salmito on 14/09/17.
//  Copyright © 2017 Bruno Salmito. All rights reserved.
//

import UIKit

class VacinaListaController:UIViewController, UITableViewDataSource, UITableViewDelegate {
     var animal:Animal?
    var vacinas = [Vacina]()
    var vacinaSelected:Vacina?
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
        let numberOfRows = vacinas.count
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
        
        
                
        
        return cell
    }
    
    //click
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let indexPath = tableView.indexPathForSelectedRow
        let currentCell = tableView.cellForRow(at: indexPath!)!
        
        self.vacinaSelected = vacinas[(indexPath?.row)!]
        self.performSegue(withIdentifier: "segueEdtVacina", sender:self)
        
    }
    
    func preencherLista(json:[[String:AnyObject]]) -> Void{
        for item in json{
            let novoItem = Vacina()
            novoItem.setValuesForKeys(item)
            vacinas.append(novoItem)
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
        if segue.identifier == "segueEdtVacina" {
            let controller =  (segue.destination as? UINavigationController)?.topViewController as? EdtAnimalController
            controller?.animal = animal
            controller?.vacina= vacinaSelected
        }
        
    }

}
