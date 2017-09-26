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
    
     var indicadorProgress:ActivityIndicadorViewPet =  ActivityIndicadorViewPet()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        callRestListaTratamento()
        
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
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? CellTratamentoLista
        
        let tratamento = tratamentos[indexPath.row]
        tableView.separatorStyle = UITableViewCellSeparatorStyle.singleLine
        cell?.lblNmTratamento.text = tratamento.nm_tratamento?.description

        return cell!
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let indexPath = tableView.indexPathForSelectedRow
        self.tratamentoSelected = tratamentos[(indexPath?.row)!]
        self.performSegue(withIdentifier: "segueEdtTratamento", sender:self)
        
    }
    
    
    func callRestListaTratamento(){
        self.indicadorProgress.open(self)
        DispatchQueue.main.async {
            CallRest.requestGetList(url: "animal/tratamento/animal/".appending((self.animal?.id?.description)!)   ,callBack: self.preencherLista, callBackError: self.erro)
        }
    }
    

    func preencherLista(json:[[String:AnyObject]]) -> Void{
 
        tratamentos = JsonUtil.listByJson(Tratamento.self,json:json)
        
        DispatchQueue.main.sync {
            self.tableViewAux?.reloadData()
            self.indicadorProgress.close()
        }
    }
    
    func erro(mapErro:MapErrorRetornoRest){
        ComponentsUtil.backErrorRest(mapErro:mapErro,controller:self,progress:self.indicadorProgress)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueEdtTratamento" {
            let controller =  (segue.destination as? EdtTratamentoController)
            controller?.animal = animal
            controller?.tratamento = tratamentoSelected
            tratamentoSelected = CastingUtil.returnNil(Tratamento.self)
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        callRestListaTratamento()
    }

}
