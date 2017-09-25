//
//  EdtTratamentoController.swift
//  Petshow_swift
//
//  Created by Bruno Salmito on 14/09/17.
//  Copyright © 2017 Bruno Salmito. All rights reserved.
//

import UIKit

class EdtTratamentoController:UITableViewController{
    var animal:Animal?
    var tratamento:Tratamento?
    
    @IBOutlet var txtNome: UITextField!
    @IBOutlet var txtFrequencia: UITextField!
    @IBOutlet var hora: UITextField!
    
    @IBOutlet var txtDtInicial: UITextField!
    
    @IBOutlet var navigation: UINavigationItem!
    @IBOutlet var txtDtFinal: UITextField!
    
    @IBOutlet var cellDelete: UITableViewCell!
    
    var pickerFrequencia:PickerFrequenciaTratamento?
    
    override func viewDidLoad() {
//        CallRest.requestGetEntity(url: "animal/vermifugo/animal/".appending((animal?.id?.description)!), callBack: self.callBackGetVermifugo, callBackError: self.callBackErrorGetVermifugo)
        super.viewDidLoad()
        
        let  frequencia = tratamento == nil ? nil : (tratamento?.frequencia)!
        
        pickerFrequencia = PickerFrequenciaTratamento().prepare(textField:txtFrequencia, controller:self,enumTp:frequencia)
        
        if(tratamento != nil){
            loadFields(tratamento:self.tratamento!)
        }else{
            tratamento = Tratamento()
            navigation.title = "Novo"
            
        }
    }
    func callBackGetVermifugo(json:[String: AnyObject]) -> Void{
       
        
        
    }
    func errorDelete(mapErro:MapErrorRetornoRest){
        print("erro chamada")
        print("erro chamada")
        
    }
    func loadFields(tratamento:Tratamento){
        txtNome.text =  tratamento.nm_tratamento?.description
        hora.text = DateUtil.formartarNsHora(date: tratamento.hrTratamento!, segundos: false)
        txtDtInicial.text  = DateUtil.formartarNsDataBrasil(date: tratamento.dataInicio!)
        txtDtFinal.text  = DateUtil.formartarNsDataBrasil(date: tratamento.dataTermino!)
        navigation.title = tratamento.nm_tratamento?.description
    }
    func getEntityScreenFields(){
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let indexPath = tableView.indexPathForSelectedRow
        let currentCell = tableView.cellForRow(at: indexPath!)!
        
        if( cellDelete == currentCell){
            deleteTratamento()
        }
    }
    
    @IBAction func openDtInicialPicker(_ sender: UITextField) {
        DatePickerData().prepare(controller: self, txt: sender,tpData: UIDatePickerMode.date, idDatePickerTela: 2)
        
    }
    
    @IBAction func openDtFinalPicker(_ sender: UITextField) {
        DatePickerData().prepare(controller: self, txt: sender,tpData: UIDatePickerMode.date, idDatePickerTela: 3)
    }
    @IBAction func openDtPickerHR(_ sender: UITextField) {
         DatePickerData().prepare(controller: self, txt: sender,tpData: UIDatePickerMode.time, idDatePickerTela: 1)
    }
    
    func deleteTratamento() {
//        CallRest.requestDeleteEntity(url: "animdsadsaal/"+(tratamento!.id?.description)!, callBack: self.backDelete, callBackError:self.errorDelete )
    }
    func backDelete(json:[String:AnyObject]) -> Void{
        returnListTratamento()
        
    }
    func returnListTratamento(){
        DispatchQueue.main.sync {
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    func handleDatePicker(sender: UIDatePicker) {
        
        if(sender.tag == 1){
            hora.text = DateUtil.formartarHora(date: sender.date, segundos: false)
        }else if (sender.tag == 2){
            txtDtInicial.text = DateUtil.formartarDataBrasil(date: sender.date)
        }else if (sender.tag == 3){
            txtDtFinal.text = DateUtil.formartarDataBrasil(date: sender.date)
        }
        
        
    }
    
    func doneButtonAction(sender:UIButton)
    {
        txtDtInicial.resignFirstResponder()
        txtDtFinal.resignFirstResponder()
        hora.resignFirstResponder()
    }



}
