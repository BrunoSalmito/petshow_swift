//
//  TratamentoListaController.swift
//  Petshow_swift
//
//  Created by Bruno Salmito on 14/09/17.
//  Copyright © 2017 Bruno Salmito. All rights reserved.
//

import UIKit

class TratamentoListaController:UITableViewController{
    var animal:Animal?
    var tratamentos = [Tratamento]()
    var tratamentoSelected:Tratamento?
    var tableViewAux:UITableView?
    
    var cellIdentifier:String = "cellTratamentoController"
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        
        CallRest.requestGetList(url: "animal/tratamento/animal/".appending((animal?.id?.description)!)   ,callBack: self.preencherLista, callBackError: self.erroLista)
        
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let numberOfRows = tratamentos.count
        tableViewAux = tableView
        return numberOfRows
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? CellTratamentoLista  else {
            fatalError("The dequeued cell is not an instance of MealTableViewCell.")
        }
        
        let tratamento = tratamentos[indexPath.row]
        tableView.separatorStyle = UITableViewCellSeparatorStyle.singleLine
        cell.lblNmTratamento.text = tratamento.nm_tratamento?.description
        
        
        
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let indexPath = tableView.indexPathForSelectedRow
        let currentCell = tableView.cellForRow(at: indexPath!)!
        
        self.tratamentoSelected = tratamentos[(indexPath?.row)!]
        self.performSegue(withIdentifier: "segueEdtTratamento", sender:self)
        
    }
    
    func preencherLista(json:[[String:AnyObject]]) -> Void{
        for item in json{
            let novoItem = Tratamento()
            novoItem.setValuesForKeys(item)
            tratamentos.append(novoItem)
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
        if segue.identifier == "segueEdtTratamento" {
            let controller =  (segue.destination as? EdtTratamentoController)
            controller?.animal = animal
            controller?.tratamento = tratamentoSelected
        }
        
    }

}
