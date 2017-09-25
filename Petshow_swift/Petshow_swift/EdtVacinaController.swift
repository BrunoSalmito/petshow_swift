//
//  EdtVacinaController.swift
//  Petshow_swift
//
//  Created by Bruno Salmito on 14/09/17.
//  Copyright © 2017 Bruno Salmito. All rights reserved.
//

import UIKit

class EdtVacinaController:UITableViewController{
    var animal:Animal?
    var vacina:Vacina?
    var pickerVacina:PickerViewVacina?
    var indicadorProgress:ActivityIndicadorViewPet =  ActivityIndicadorViewPet()
    
    @IBOutlet var txtTipoVacina: UITextField!
    @IBOutlet var txtDataAplicacao: UITextField!
    @IBOutlet var switchAplicada: UISwitch!
    @IBOutlet var txtDataPrevisao: UITextField!
    @IBOutlet var cellDelete: UITableViewCell!
    @IBOutlet var navigation: UINavigationItem!
    @IBOutlet var cellVacina: UITableViewCell!
    @IBOutlet var labelDescVac: UILabel!
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        let  tipo = vacina == nil ? EnumVacina.getListEnumByTypeAnimal(enumTipoAnimal: (animal?.tipo)!)?[0] : (vacina?.tpVacina)!
      
        pickerVacina = PickerViewVacina().prepare(textField: txtTipoVacina, controller: self, enumTpAnimal: (animal?.tipo)!, enumVacina: tipo)
        
        if(vacina != nil){
            loadFields(vacina:self.vacina!)
        }else{
            vacina = Vacina()
            navigation.title = "Novo"
            txtDataAplicacao.text = DateUtil.formartarDataBrasil(date: Date())
            switchAplicada.setOn(false, animated: false)
        }
        
        
        ComponentsUtil.configurarTextField(textField: txtTipoVacina)
        ComponentsUtil.configurarTextField(textField: txtDataAplicacao)
        ComponentsUtil.configurarTextField(textField: txtDataPrevisao)
        
    }

    
    
    @IBAction func openData(_ sender: UITextField) {
        DatePickerData().prepare(controller: self, txt: sender,tpData: UIDatePickerMode.date, idDatePickerTela: 1)
       
    }
    
    @IBAction func openDataPrevisao(_ sender: UITextField) {
        DatePickerData().prepare(controller: self, txt: sender,tpData: UIDatePickerMode.date, idDatePickerTela: 2)
    }
    
    
    @IBAction func changeDescVacina(_ sender: UITextField) {
        
        indicadorProgress.open("carregando", controller: self)
        labelDescVac.text = EnumVacina.getEnum(orderId: (pickerVacina?.rowSelected)!)?.nome
        indicadorProgress.close()
        
    }
    
    
    @IBAction func validationSaveVacina(_ sender: UIBarButtonItem){
        if(!ValidationUtil.validationTextFieldData(txt: txtDataAplicacao)){
            ComponentsUtil.criationAlertValidation(controller: self, message: "Informe uma data de aplicação!")
            return
        }
        saveVacina()
        
    }
     
    func saveVacina() {
        indicadorProgress.open("Salvando vacina", controller: self)
        setEntityScreenFields()
        DispatchQueue.main.async {
            CallRest.requestPostEntity(url: "animal/vacina/salvar", entidade: self.vacina!, callBack: self.callBackSalvarVacina, callBackError: self.error)
        }
    }
    
    func callBackSalvarVacina(json:[String: AnyObject]) -> Void{
        
        JsonUtil.setfieldsJsonReturn(entidade:self.vacina!, json:json)
 
        DispatchQueue.main.async {
            self.loadFields(vacina:self.vacina!)
            self.indicadorProgress.close()
        }
    }
    
    
    func setEntityScreenFields(){
        vacina?.animal = self.animal
        vacina?.tpVacina = pickerVacina?.enumVacinaSelected
        vacina?.data = DateUtil.dataBrasilToDate(date: txtDataAplicacao.text!)
        if(ValidationUtil.validationTextFieldData(txt:txtDataPrevisao)){
            vacina?.previsaoProxima = DateUtil.dataBrasilToDate(date: txtDataPrevisao.text!)
        }
        vacina?.flAplicada = switchAplicada.isOn
        
    }
    
    func loadFields(vacina:Vacina){
        if(vacina.id != nil && (vacina.id?.intValue)! > 0){
            txtTipoVacina.text = vacina.tpVacina?.nome
            txtDataAplicacao.text = DateUtil.formartarDataBrasil(date: vacina.data!)
            switchAplicada.setOn(vacina.flAplicada!, animated: false)
            if(vacina.previsaoProxima != nil){
                txtDataPrevisao.text = DateUtil.formartarDataBrasil(date: vacina.previsaoProxima!)
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let indexPath = tableView.indexPathForSelectedRow
        let currentCell = tableView.cellForRow(at: indexPath!)!
        
        if( cellDelete == currentCell){
            validationDeleteVacina()
        }
    }
    
    func handleDatePicker(sender: UIDatePicker) {
        if(sender.tag == 1){
            txtDataAplicacao.text = DateUtil.formartarDataBrasil(date: sender.date)
        }else if (sender.tag == 2){
            txtDataPrevisao.text = DateUtil.formartarDataBrasil(date: sender.date)
        }
        
    }
    
    func doneButtonAction(sender:UIButton)
    {
        txtDataAplicacao.resignFirstResponder()
        txtDataPrevisao.resignFirstResponder()
        
    }
    
    func validationDeleteVacina(){
        
        if(self.vacina!.id == nil){
            ComponentsUtil.criationAlertValidation(controller: self, message: "Não existe vacina cadastrada!")
            return
        }
        ComponentsUtil.criationOptionSheet(controller: self, message: "Deletar Vacina", functionOk: self.deleteVacina, functionCancel: nil)
        
    }
    
    func deleteVacina(){
        
        indicadorProgress.open("Deletando vacina", controller: self)
        DispatchQueue.main.async {
            CallRest.requestDeleteEntity(url: "animal/vacina/"+(self.vacina!.id?.description)!, callBack: self.backDelete, callBackError:self.error )
        
        }
    }
    func backDelete(json:[String:AnyObject]) -> Void{
        indicadorProgress.close()
        DispatchQueue.main.sync {
           self.navigationController?.popViewController(animated: true)
        }
        
    }
    
    func error(mapErro:MapErrorRetornoRest){
        ComponentsUtil.backErrorRest(mapErro:mapErro,controller:self,progress:self.indicadorProgress)
        
    }

    
    
    
    
    
    
}
