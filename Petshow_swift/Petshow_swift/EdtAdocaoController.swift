//
//  EdtAdocaoController.swift
//  Petshow_swift
//
//  Created by Bruno Salmito on 27/09/17.
//  Copyright © 2017 Bruno Salmito. All rights reserved.
//

import UIKit

class EdtAdocaoController: UITableViewController {

    var adocao:Adocao?
    var pickerViewTipoAnimal:PickerViewTipoAnimal?
    var pickerPorte:PickerPorteAnimal?
    var pickerFase:PickerFaseVida?
    var pickerSexo:PickerSexo?
    var indicadorProgress:ActivityIndicadorViewPet =  ActivityIndicadorViewPet()
    
    
    @IBOutlet var txtTipoAnimal: UITextField!
    @IBOutlet var txtPorte: UITextField!
    @IBOutlet var txtFase: UITextField!
    @IBOutlet var txtSexo: UITextField!
    @IBOutlet var swVacinado: UISwitch!
    @IBOutlet var swCastrado: UISwitch!
    @IBOutlet var swVermifugado: UISwitch!
    @IBOutlet var txtDesc: UITextView!
    @IBOutlet var cellAdotado: UITableViewCell!
    @IBOutlet var cellDelete: UITableViewCell!
    @IBOutlet var validationSalvar: UIBarButtonItem!
    
    @IBOutlet var stackTest: UIStackView!
    
    @IBOutlet var image1: UIImageView!
    @IBOutlet var image2: UIImageView!
    @IBOutlet var image3: UIImageView!
   // @IBOutlet var image2: UIImageView!
    
   // @IBOutlet var image3: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let  tipo = adocao == nil ? nil :  (adocao?.tipo)
        let  porte = adocao == nil ? nil :  (adocao?.porteAnimal)
        let  fase = adocao == nil ? nil :  (adocao?.fase)
        let  sexo = adocao == nil ? nil :  (adocao?.flSexo)
        
        pickerViewTipoAnimal = PickerViewTipoAnimal().prepare(textField:txtTipoAnimal,controller: self,nil,enumTp : tipo)
        
        pickerPorte = PickerPorteAnimal().prepare(textField: txtPorte, controller: self, enumTp: porte)
        
        pickerFase = PickerFaseVida().prepare(textField: txtFase, controller: self, enumTp: fase)
        
        pickerSexo = PickerSexo().prepare(textField: txtSexo, controller: self, enumTp: sexo?.description)
        
        
        if(adocao != nil){
            loadFields(adocao:self.adocao!)
        }else{
            adocao = Adocao()
            //navigation.title = "Novo"
            
            swVacinado.setOn(false, animated: false)
            swCastrado.setOn(false, animated: false)
            swVermifugado.setOn(false, animated: false)
        }
        image3.isHidden = true
        image1.isHidden = true
        
//        let firstView = stackTest.arrangedSubviews[0]
//        firstView.isHidden = true
//        let firstView2 = stackTest.arrangedSubviews[1]
//        firstView2.isHidden = true
    }
    
    
    @IBAction func ValidationSalvar(_ sender: Any) {
        // criar validacao para não alterar quando o animal for adotado!!!
        
        if(!ValidationUtil.validationTextFieldString(txt: txtTipoAnimal)){
            ComponentsUtil.criationAlertValidation(controller: self, message: "Informe que tipo de animal você está colocando para adoção!")
            return
        }
        if(!ValidationUtil.validationTextFieldString(txt: txtFase)){
            ComponentsUtil.criationAlertValidation(controller: self, message: "Informe se o animal é filhote, adulto ou idoso")
            return
        }
        if(!ValidationUtil.validationTextViewString(txt: txtDesc)){
            ComponentsUtil.criationAlertValidation(controller: self, message: "Fale sobre o animal no campo de descrição!")
            return
        }
        if(txtDesc.text.characters.count < 30 ){
            ComponentsUtil.criationAlertValidation(controller: self, message: "Você falou pouco sobre o animal!! Fale um pouco mais no campo de descrição!")
            return
        }
        
        saveAdocao()
        
    }
    
    func saveAdocao() {
        indicadorProgress.open("Salvando Animal", controller: self)
        setEntityScreenFields()
        DispatchQueue.main.async {
            CallRest.requestPostEntity(url: "animal/vacina/salvar", entidade: self.adocao!, callBack: self.callBackSalvarAdocao, callBackError: self.error)
        }
    }
    
    
    @IBAction func back(_ sender: Any) {
        returnListAnimal()
    }
    
    func returnListAnimal(){
        DispatchQueue.main.sync {
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    
    func callBackSalvarAdocao(json:[String: AnyObject]) -> Void{
        
        JsonUtil.setfieldsJsonReturn(entidade:self.adocao!, json:json)
        
        DispatchQueue.main.async {
            self.loadFields(adocao:self.adocao!)
            self.indicadorProgress.close()
        }
    }
    
   
    func setEntityScreenFields(){

        adocao?.tipo = pickerViewTipoAnimal?.enumAnimalSelected
        adocao?.porteAnimal = pickerPorte?.enumSelected
        adocao?.fase = pickerFase?.enumSelected
        adocao?.flSexo = NSString(string:(pickerSexo?.sexoSelected)! )
        adocao?.flVacinado = swVacinado.isOn
        adocao?.castrado = swCastrado.isOn
        adocao?.flVermifugado = swVermifugado.isOn
        adocao?.descAdocao = NSString(string: txtDesc.text)
    }
    
    func loadFields(adocao:Adocao){
        if(ValidationUtil.validationNumber(number: adocao.id)){
            
            txtTipoAnimal.text = adocao.tipo?.rawValue
            txtPorte.text = adocao.porteAnimal?.rawValue
            txtFase.text = adocao.fase?.rawValue
            txtSexo.text = EnumSexo.getDescEnum(caractere: (adocao.flSexo?.description)!)
            swVacinado.setOn(adocao.flVacinado!, animated: false)
            swCastrado.setOn(adocao.castrado!, animated: false)
            swVermifugado.setOn(adocao.flVermifugado!, animated: false)
            txtDesc.text = adocao.descAdocao?.description
        }
        
        
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let indexPath = tableView.indexPathForSelectedRow
        let currentCell = tableView.cellForRow(at: indexPath!)!
        
        if( cellAdotado == currentCell){
            validationFoiAdotado()
        }
        
        if( cellDelete == currentCell){
            validationDeleteAdocao()
        }
    }
    
    func validationDeleteAdocao(){
        
        if(self.adocao!.id == nil){
            ComponentsUtil.criationAlertValidation(controller: self, message: "Não existe animal cadastrado!")
            return
        }
        ComponentsUtil.criationOptionSheet(controller: self, message: "Deletar animal", functionOk: self.deleteAdocao, functionCancel: nil)
        
    }
    
    func deleteAdocao(){
        
        indicadorProgress.open("Deletando animal ", controller: self)
        DispatchQueue.main.async {
            CallRest.requestDeleteEntity(url: "animal/vacina/"+(self.adocao!.id?.description)!, callBack: self.backDelete, callBackError:self.error )
            
        }
    }
    func backDelete(json:[String:AnyObject]) -> Void{
        indicadorProgress.close()
        DispatchQueue.main.sync {
            returnListAnimal()
        }
        
    }
    
    func error(mapErro:MapErrorRetornoRest){
        ComponentsUtil.backErrorRest(mapErro:mapErro,controller:self,progress:self.indicadorProgress)
        
    }
    
    
    func validationFoiAdotado(){
        
        if(self.adocao!.id == nil){
            ComponentsUtil.criationAlertValidation(controller: self, message: "Não existe animal cadastrado!")
            return
        }
        ComponentsUtil.criationOptionSheet(controller: self, message: "Animal Adotado", functionOk: self.foiAdotado, functionCancel: nil)
        
    }
    
    func foiAdotado(){
        // fazer Rest informado que o animal foi adotado
    }

    
}
