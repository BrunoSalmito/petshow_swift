//
//  EdtPerdidoController.swift
//  Petshow_swift
//
//  Created by Bruno Salmito on 27/09/17.
//  Copyright © 2017 Bruno Salmito. All rights reserved.
//

import UIKit
import VMaskTextField

class EdtPerdidoController: UITableViewController {
    var pickerViewRaca:PickerViewRaca?
    var pickerViewTipoAnimal:PickerViewTipoAnimal?
    var pickerCorP:PickerCor?
    var pickerCorS:PickerCor?
    var perdido:Perdido?
    var indicadorProgress:ActivityIndicadorViewPet =  ActivityIndicadorViewPet()
    

    @IBOutlet  var txtSearch: TextFieldSearch!
    @IBOutlet var segAcontecimento: UISegmentedControl!
    @IBOutlet var txtDataAcontecimento: UITextField!
    @IBOutlet var txtLocalAcontecimento: TextFieldSearch!
    @IBOutlet var txtTelefone: UITextField!
    @IBOutlet var txtTipoAnimal: UITextField!
    @IBOutlet var txtRaca: UITextField!
    @IBOutlet var txtColorPrimaria: UITextField!
    @IBOutlet var txtColorSegundaria: UITextField!
    @IBOutlet var segSexo: UISegmentedControl!
    @IBOutlet var txtDesc: UITextView!
    @IBOutlet var cellEncontrouDono: UITableViewCell!
    @IBOutlet var cellDelete: UITableViewCell!
    
    @IBOutlet var txtMaskTelefone: VMaskTextField!
    
    override func viewDidLoad() {
        
        
        super.viewDidLoad()
        
        let  raca = perdido == nil ? nil : (perdido?.raca?.description)!
        let  tipo = perdido == nil ? nil :  (perdido?.tpAnimal)
        let  corP = perdido == nil ? nil :  (perdido?.tpCorPrincipal)
        let  corS = perdido == nil ? nil :  (perdido?.tpCorSegundaria)
        
        pickerViewRaca = PickerViewRaca().prepare(textField:txtRaca,controller: self, raca: raca)
        pickerViewTipoAnimal = PickerViewTipoAnimal().prepare(textField:txtTipoAnimal,controller: self,pickerViewRaca,enumTp : tipo)
        pickerCorP = PickerCor().prepare(textField:txtColorPrimaria,controller: self, enumTp:  corP)
        pickerCorS = PickerCor().prepare(textField:txtColorSegundaria,controller: self, enumTp:  corS)
        txtLocalAcontecimento.prepare(controller: self)
        txtMaskTelefone.mask = "(##) ####-####"
        
        if(perdido != nil){
            loadFields(perdido:self.perdido!)
        }else{
            perdido = Perdido()
            //navigation.title = "Novo"
            
        }
        txtDesc.placeholder = "Descreva como encontrou o animal e fale um pouco sobre ele...."
    
    }
    
    @IBAction func validationSave(_ sender: Any) {
//        if(!ValidationUtil.validationTextFieldString(txt: txtAnimal)){
//            ComponentsUtil.criationAlertValidation(controller: self, message: "Informe qual o animal!")
//            return
//        }
//        if(!ValidationUtil.validationTextFieldString(txt: txtNome)){
//            ComponentsUtil.criationAlertValidation(controller: self, message: "Informe um nome para seu pet!")
//            return
//        }
        
        savePerdido()
        
    }
    
    @IBAction func back(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
        
    }
    
    @IBAction func openData(_ sender: UITextField) {
        DatePickerData().prepare(controller: self, txt: sender,tpData: UIDatePickerMode.date, idDatePickerTela: 1)
    }
    
    
    func savePerdido() {
        getEntityScreenFields()
        
        self.indicadorProgress.open("Salvando", controller: self)
        
        DispatchQueue.main.async {
                 CallRest.requestPostEntity(url: "animal/perdido/salvar", entidade: self.perdido!, callBack: self.callBackSalvarPerdido, callBackError: self.error)
        }
    }

    @IBAction func openAutoComplete(_ sender: Any) {
        
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let indexPath = tableView.indexPathForSelectedRow
        let currentCell = tableView.cellForRow(at: indexPath!)!
        
        if(!ValidationUtil.validationNumber(number: perdido?.id)){
             ComponentsUtil.criationAlertValidation(controller: self, message: "O animal ainda não foi cadastrado")
            return
        }
        
        
        if( cellEncontrouDono == currentCell){
          
        }
        
        if( cellDelete == currentCell){
            //validationDeletePerdido()
        }
    }
    
    func validationDeletePerdido() {
        //        if(!ValidationUtil.validationTextFieldString(txt: txtAnimal)){
        //            ComponentsUtil.criationAlertValidation(controller: self, message: "Informe qual o animal!")
        //            return
        //        }
        //        if(!ValidationUtil.validationTextFieldString(txt: txtNome)){
        //            ComponentsUtil.criationAlertValidation(controller: self, message: "Informe um nome para seu pet!")
        //            return
        //        }
        
        ComponentsUtil.criationOptionSheet(controller: self, message: "Tem certeza que deseja deletar o animal ?", functionOk: self.deletePerdido, functionCancel: nil)
        
        
    }

    func deletePerdido() {
        DispatchQueue.main.async {
            CallRest.requestDeleteEntity(url: "animal/perdido/"+(self.perdido?.id?.description)!, callBack: self.backDelete, callBackError:self.error )
        }
    }

    func callBackSalvarPerdido(json:[String: AnyObject]) -> Void{
        JsonUtil.setfieldsJsonReturn(entidade:self.perdido!, json:json)
        
        DispatchQueue.main.async {
            self.loadFields(perdido:self.perdido!)
            self.indicadorProgress.close()
        }
    }
    
    func error(mapErro:MapErrorRetornoRest){
        ComponentsUtil.backErrorRest(mapErro:mapErro,controller:self,progress:self.indicadorProgress)
        
    }
    
    
    func handleDatePicker(sender: UIDatePicker) {
        txtDataAcontecimento.text = DateUtil.formartarDataBrasil(date: sender.date)
        
    }
    
    func doneButtonAction(sender:UIButton) {
        txtDataAcontecimento.resignFirstResponder()
    }

    func loadFields(perdido:Perdido){
        
        
        //txtTelefone.text = perdido.
        //txtLocalAcontecimento.text
        txtDataAcontecimento.text = DateUtil.formartarDataBrasil(date: perdido.dtPerdidoAchado!)
        txtTipoAnimal.text = perdido.tpAnimal?.rawValue
       // txtRaca.text = perdido.raca?.descricao?.description
        txtColorPrimaria.text = perdido.tpCorPrincipal?.rawValue
        txtColorSegundaria.text = perdido.tpCorSegundaria?.rawValue
        txtDesc.text = perdido.descAcontecimento?.description
        
        if (perdido.flAcontecimento  == "M"){
            segAcontecimento.selectedSegmentIndex = 0
        }else{
            segAcontecimento.selectedSegmentIndex = 1
        }
        
        if (perdido.flSexo == "M"){
            segSexo.selectedSegmentIndex = 0
        }else{
            segSexo.selectedSegmentIndex = 1
        }
    }
    func getEntityScreenFields(){
        perdido?.dtPerdidoAchado = DateUtil.dataBrasilToDate(date: txtDataAcontecimento.text!)
        perdido?.tpAnimal =  pickerViewTipoAnimal?.enumAnimalSelected
        perdido?.tpCorPrincipal = pickerCorP?.enumSelected
        perdido?.tpCorSegundaria = pickerCorS?.enumSelected
        perdido?.descAcontecimento = NSString(string:txtDesc.text!)
        perdido?.flAcontecimento = ( segAcontecimento.selectedSegmentIndex == 0 ?"M":"F")
        perdido?.flSexo = ( segSexo.selectedSegmentIndex == 0 ?"M":"F")
//        animal.nome = NSString(string: txtNome.text!)
//        animal.tipo = EnumTipoAnimal.getEnum(orderId: (pickerViewTipoAnimal?.rowSelected)!)
//        animal.raca = pickerViewRaca?.getSelectedRaca()
//        animal.fotoPerfil = ImageUtil.imageToNSString64(image: imageAnimal.image!)
//        animal.dataNascimento = DateUtil.dataBrasilToDate(date: txtNascimento.text!)
//        animal.flSexo = ( segmentSexo.selectedSegmentIndex == 0 ?"M":"F")
//        
        
    }
    
   
    
    func backDelete(json:[String:AnyObject]) -> Void{
        returnListAnimal()
        
    }


    func returnListAnimal(){
        DispatchQueue.main.sync {
            self.dismiss(animated: true, completion: nil)
        }
    }
    
   
  
   
}
