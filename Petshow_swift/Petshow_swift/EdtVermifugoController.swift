//
//  EdtVermifugoController.swift
//  Petshow_swift
//
//  Created by Bruno Salmito on 21/09/17.
//  Copyright © 2017 Bruno Salmito. All rights reserved.
//


import UIKit

class EdtVermifugoController:UITableViewController{
    var animal:Animal?
    var vermifugo:Vermifugo?
    var pickerFrequencia:PickerFrequenciaVermifugacao?
    var indicadorProgress:ActivityIndicadorViewPet =  ActivityIndicadorViewPet()
    
    @IBOutlet var txtDataReforco: UITextField!
    @IBOutlet var txtDataPrimeiraDose: UITextField!
    @IBOutlet var txtFrequencia: UITextField!
    @IBOutlet var swTomouPrimeiraDose: UISwitch!
    @IBOutlet var swTomouSegundaDose: UISwitch!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        indicadorProgress.open(self)
        DispatchQueue.main.async {
            CallRest.requestGetEntity(url: "animal/vermifugo/animal/".appending((self.animal?.id?.description)!), callBack: self.callBackGetVermifugo, callBackError: self.error)
        }
    }
    
    @IBAction func openDtReforco(_ sender: UITextField) {
        DatePickerData().prepare(controller: self, txt: sender,tpData: UIDatePickerMode.date, idDatePickerTela: 2)
    }
    
    @IBAction func openDtPrimeiraDose(_ sender: UITextField) {
        DatePickerData().prepare(controller: self, txt: sender,tpData: UIDatePickerMode.date, idDatePickerTela: 1)
    }
    
    @IBAction func save(_ sender: UIBarButtonItem) {
        getEntityScreenFields()
        indicadorProgress.open("Salvando Vermifugo",controller: self)
         DispatchQueue.main.async {
            self.vermifugo?.animal = self.animal
            CallRest.requestPostEntity(url: "animal/vermifugo/salvar", entidade: self.vermifugo!, callBack: self.callBackSalvarAnimal, callBackError: self.error)
        }
    }
    
    
    func callBackGetVermifugo(json:[String: AnyObject]) -> Void{
        
        DispatchQueue.main.async {
            self.vermifugo =  JsonUtil.entidadeByJsonNew(Vermifugo.self,json:json)
            
            let  frequencia = self.vermifugo == nil ? nil : (self.vermifugo?.frequencia)!
            
            self.pickerFrequencia = PickerFrequenciaVermifugacao().prepare(textField:self.txtFrequencia, controller:self,enumTp:frequencia)
            
            if(self.vermifugo != nil){
                self.loadFields(vermifugo:self.vermifugo!)
            }else{
                self.vermifugo = Vermifugo()
                self.vermifugo?.animal = self.animal
            }
            
            
            self.indicadorProgress.close()
        }
        
    }
    
    func callBackSalvarAnimal(json:[String: AnyObject]) -> Void{
        JsonUtil.setfieldsJsonReturn(entidade:self.vermifugo!, json:json)
        
        DispatchQueue.main.async {
            self.loadFields(vermifugo:self.vermifugo!)
            self.indicadorProgress.close()
        }
        
    }
    
    func loadFields(vermifugo:Vermifugo){
        txtFrequencia.text = vermifugo.frequencia?.desc
        txtDataPrimeiraDose.text = DateUtil.formartarDataBrasil(date: vermifugo.dtVermifugoDose1!)
        txtDataReforco.text = DateUtil.formartarDataBrasil(date: vermifugo.dtVermifugoDoseReforco!)
        swTomouPrimeiraDose.setOn(vermifugo.isTomou1!, animated: false)
        swTomouSegundaDose.setOn(vermifugo.isTomouReforco!, animated: false)
    }
    
    func getEntityScreenFields(){
        
        vermifugo?.frequencia = EnumFrequenciaVermifugacao.getEnum(orderId: (pickerFrequencia?.rowSelected)!)
        vermifugo?.dtVermifugoDose1 = DateUtil.dataBrasilToDate(date: txtDataPrimeiraDose.text!)
        vermifugo?.dtVermifugoDoseReforco = DateUtil.dataBrasilToDate(date: txtDataReforco.text!)
        vermifugo?.isTomou1 = swTomouPrimeiraDose.isOn
        vermifugo?.isTomouReforco = swTomouSegundaDose.isOn
        
        
    }
    
    func returnViewAnterior(){
        DispatchQueue.main.async {
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    func handleDatePicker(sender: UIDatePicker) {
        
        if(sender.tag == 1){
            txtDataPrimeiraDose.text = DateUtil.formartarDataBrasil(date: sender.date)
        }else if (sender.tag == 2){
            txtDataReforco.text = DateUtil.formartarDataBrasil(date: sender.date)
        }
        
        
    }
    
    func doneButtonAction(sender:UIButton)
    {
        txtDataReforco.resignFirstResponder()
        txtDataPrimeiraDose.resignFirstResponder()
        
    }
    func error(mapErro:MapErrorRetornoRest){
        ComponentsUtil.backErrorRest(mapErro:mapErro,controller:self,progress:self.indicadorProgress)
        
    }
    
    
    
}
