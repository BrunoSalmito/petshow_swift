//
//  VacinaListaController.swift
//  Petshow_swift
//
//  Created by Bruno Salmito on 14/09/17.
//  Copyright © 2017 Bruno Salmito. All rights reserved.
//

import UIKit

class VacinaListaController:UITableViewController {
    var animal:Animal?
    var vacinas = [Vacina]()
    var vacinaSelected:Vacina?
    var tableViewAux:UITableView?
    var cellIdentifier:String = "cellVacinaController"
    
    var indicadorProgress:ActivityIndicadorViewPet =  ActivityIndicadorViewPet()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        callRestListVacina()
        
    }
   
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let numberOfRows = vacinas.count
        tableViewAux = tableView
        return numberOfRows
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? CellVacinaLista
        
        let vacina = vacinas[indexPath.row]
        tableView.separatorStyle = UITableViewCellSeparatorStyle.singleLine
        cell?.lblNomeVacina.text = vacina.tpVacina?.rawValue
        if(vacina.flAplicada!){
            cell?.lblDataAplicacao.text = "Aplicada em "+DateUtil.formartarDataBrasil(date: vacina.data!)
            cell?.backgroundColor = UIColor.green
        }else{
            cell?.lblDataAplicacao.text = "Previsão de aplicação :"+DateUtil.formartarDataBrasil(date: vacina.data!)
        }
       
        
        return cell!
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let indexPath = tableView.indexPathForSelectedRow
       
        
        self.vacinaSelected = vacinas[(indexPath?.row)!]
        self.performSegue(withIdentifier: "segueEdtVacina", sender:self)
        
    }
        
    func preencherLista(json:[[String:AnyObject]]) -> Void{
        
        vacinas = JsonUtil.listByJson(Vacina.self,json:json)

        DispatchQueue.main.sync {
            self.tableViewAux?.reloadData()
            self.indicadorProgress.close()
        }
    }
    
    func error(mapErro:MapErrorRetornoRest){
        ComponentsUtil.backErrorRest(mapErro:mapErro,controller:self,progress:self.indicadorProgress)
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        callRestListVacina()
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueEdtVacina" {
            let controller =  (segue.destination as? EdtVacinaController)
            controller?.animal = animal
            controller?.vacina = vacinaSelected
            vacinaSelected = CastingUtil.returnNil(Vacina.self)
        }
        
    }
    func callRestListVacina(){
        self.indicadorProgress.open(self)
        DispatchQueue.main.async {
            CallRest.requestGetList(url: "animal/vacina/animal/".appending((self.animal?.id?.description)!)   ,callBack: self.preencherLista, callBackError: self.error)
        }
        
    }
    
    
}
