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
    var indicadorProgress:ActivityIndicadorViewPet =  ActivityIndicadorViewPet()
    
    @IBOutlet var txtNome: UITextField!
    @IBOutlet var txtFrequencia: UITextField!
    @IBOutlet var hora: UITextField!
    @IBOutlet var txtDtInicial: UITextField!
    @IBOutlet var navigation: UINavigationItem!
    @IBOutlet var txtDtFinal: UITextField!
    @IBOutlet var cellDelete: UITableViewCell!
    
    var pickerFrequencia:PickerFrequenciaTratamento?
    
    override func viewDidLoad() {

        super.viewDidLoad()
        
        let  frequencia = tratamento == nil ? nil : (tratamento?.frequencia)!
        
        pickerFrequencia = PickerFrequenciaTratamento().prepare(textField:txtFrequencia, controller:self,enumTp:frequencia)
        
        if(tratamento != nil){
            loadFields(tratamento:self.tratamento!)
        }else{
            tratamento = Tratamento()
            navigation.title = "Novo"
            txtDtInicial.text  = DateUtil.formartarDataBrasil(date: Date())
            txtDtFinal.text  = DateUtil.formartarDataBrasil(date: Date())
            
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
    
    
    @IBAction func validationSaveTratamento(_ sender: Any) {
//        if(!ValidationUtil.validationTextFieldData(txt: txtDataAplicacao)){
//            ComponentsUtil.criationAlertValidation(controller: self, message: "Informe uma data de aplicação!")
//            return
//        }
        saveTratamento()
    }
    
    func saveTratamento(){
    
        indicadorProgress.open("Salvando tratamento", controller: self)
        setEntityScreenFields()
        DispatchQueue.main.async {
            CallRest.requestPostEntity(url: "animal/tratamento/salvar", entidade: self.tratamento!, callBack: self.callBackGetTratamento, callBackError: self.error)
        }
    }
    
   
    
    func callBackGetTratamento(json:[String: AnyObject]) -> Void{
       
        JsonUtil.setfieldsJsonReturn(entidade:self.tratamento!, json:json)
        
        DispatchQueue.main.async {
            self.loadFields(tratamento:self.tratamento!)
            self.indicadorProgress.close()
        }
        
    }
    func error(mapErro:MapErrorRetornoRest){
        ComponentsUtil.backErrorRest(mapErro:mapErro,controller:self,progress:self.indicadorProgress)
   }

    func loadFields(tratamento:Tratamento){
         if(tratamento.id != nil && (tratamento.id?.intValue)! > 0){
            txtNome.text =  tratamento.nm_tratamento?.description
            hora.text = DateUtil.formartarHora (date:tratamento.hrTratamento!,segundos:false)
            txtDtInicial.text  = DateUtil.formartarDataBrasil(date: tratamento.dataInicio!)
            txtDtFinal.text  = DateUtil.formartarDataBrasil(date: tratamento.dataTermino!)
            navigation.title = tratamento.nm_tratamento?.description
        }
    }
    func setEntityScreenFields(){
        tratamento?.animal = self.animal
        tratamento?.dataInicio = DateUtil.dataBrasilToDate(date: txtDtInicial.text!)
        tratamento?.dataTermino =  DateUtil.dataBrasilToDate(date: txtDtFinal.text!)
        tratamento?.frequencia = pickerFrequencia?.enumSelected
        tratamento?.nm_tratamento = txtNome.text! as NSString
        tratamento?.hrTratamento = DateUtil.hourDescToDate(hour:hora.text! ,seconds:false )
      

    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let indexPath = tableView.indexPathForSelectedRow
        let currentCell = tableView.cellForRow(at: indexPath!)!
        
        if( cellDelete == currentCell){
            deleteTratamento()
        }
    }
    
    
    
    func deleteTratamento() {
        
        indicadorProgress.open("Salvando vacina", controller: self)
        DispatchQueue.main.async {
            CallRest.requestDeleteEntity(url: "animal/tratamento/"+(self.tratamento!.id?.description)!, callBack: self.backDelete, callBackError:self.error )
        }
    }
    
    func backDelete(json:[String:AnyObject]) -> Void{
        indicadorProgress.close()
        returnListTratamento()
        
    }
    
    func returnListTratamento(){
        DispatchQueue.main.async {
            self.navigationController?.popViewController(animated: true)
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
