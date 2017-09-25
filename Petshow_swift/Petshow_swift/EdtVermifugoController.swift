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
    
    @IBOutlet var txtDataReforco: UITextField!
    @IBOutlet var txtDataPrimeiraDose: UITextField!
    @IBOutlet var txtFrequencia: UITextField!
    @IBOutlet var swTomouPrimeiraDose: UISwitch!
    @IBOutlet var swTomouSegundaDose: UISwitch!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        CallRest.requestGetEntity(url: "animal/vermifugo/animal/".appending((animal?.id?.description)!), callBack: self.callBackGetVermifugo, callBackError: self.callBackErrorGetVermifugo)
        
        
        
        
    }
    
    func callBackGetVermifugo(json:[String: AnyObject]) -> Void{
        
        let entidadeRetorno = Vermifugo()
        entidadeRetorno.setValuesForKeys(json)
        self.vermifugo = entidadeRetorno
        let  frequencia = vermifugo == nil ? nil : (vermifugo?.frequencia)!
        
        pickerFrequencia = PickerFrequenciaVermifugacao().prepare(textField:txtFrequencia, controller:self,enumTp:frequencia)
        
        if(vermifugo != nil){
            loadFields(vermifugo:self.vermifugo!)
        }else{
            vermifugo = Vermifugo()
            
            
        }
        
    }
    func callBackErrorGetVermifugo(mapErro:MapErrorRetornoRest){
        print("erro chamada")
        print("erro chamada")
        
    }
    
    @IBAction func save(_ sender: UIBarButtonItem) {
        getEntityScreenFields()
        CallRest.requestPostEntity(url: "animal/vermifugo/salvar", entidade: self.vermifugo!, callBack: callBackSalvarAnimal, callBackError: errorDelete)
    }
    func callBackSalvarAnimal(json:[String: AnyObject]) -> Void{
        var retorno = "retorno"
        //        DispatchQueue.main.sync {
        //            self.dismiss(animated: true, completion: nil)
        //        }
    }
    func errorDelete(mapErro:MapErrorRetornoRest){
        print("erro chamada")
        print("erro chamada")
        
    }
    func loadFields(vermifugo:Vermifugo){
       // txtFrequencia.text = vermifugo.frequencia?.desc
        txtDataPrimeiraDose.text = DateUtil.formartarNsDataBrasil(date: vermifugo.dtVermifugoDose1!)
        txtDataReforco.text = DateUtil.formartarNsDataBrasil(date: vermifugo.dtVermifugoDoseReforco!)
        swTomouPrimeiraDose.setOn(vermifugo.isTomou1!, animated: false)
        swTomouSegundaDose.setOn(vermifugo.isTomouReforco!, animated: false)
    }
    
    func getEntityScreenFields(){
        vermifugo?.frequencia = EnumFrequenciaVermifugacao.getEnum(orderId: (pickerFrequencia?.rowSelected)!)
        vermifugo?.dtVermifugoDose1 = DateUtil.dataBrasilToNSDate(date: txtDataPrimeiraDose.text!)
        vermifugo?.dtVermifugoDoseReforco = DateUtil.dataBrasilToNSDate(date: txtDataReforco.text!)
        vermifugo?.isTomou1 = swTomouPrimeiraDose.isOn
        vermifugo?.isTomouReforco = swTomouSegundaDose.isOn
        
    
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let indexPath = tableView.indexPathForSelectedRow
        let currentCell = tableView.cellForRow(at: indexPath!)!
        
        
    }
    
    @IBAction func openDtReforco(_ sender: UITextField) {
        DatePickerData().prepare(controller: self, txt: sender,tpData: UIDatePickerMode.date, idDatePickerTela: 2)
    }
    
    @IBAction func openDtPrimeiraDose(_ sender: UITextField) {
        DatePickerData().prepare(controller: self, txt: sender,tpData: UIDatePickerMode.date, idDatePickerTela: 1)
    }
    
  
  
    
    
    func returnViewAnterior(){
        DispatchQueue.main.sync {
            self.dismiss(animated: true, completion: nil)
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
    
    
    
}
