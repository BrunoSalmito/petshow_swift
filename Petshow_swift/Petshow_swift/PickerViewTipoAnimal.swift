//
//  PickerViewTipoAnimal.swift
//  Petshow_swift
//
//  Created by Bruno Salmito on 11/09/17.
//  Copyright © 2017 Bruno Salmito. All rights reserved.
//

import UIKit

class PickerViewTipoAnimal: UIPickerView,UIPickerViewDataSource, UIPickerViewDelegate {
    
    
    var textField:UITextField?
    var controller:UIViewController?
    var rowSelected = -1
    var pickerViewRaca :PickerViewRaca?
    var enumAnimalSelected:EnumTipoAnimal?
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return EnumTipoAnimal.count+1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return row == 0 ? "" :EnumTipoAnimal.getEnum(orderId: row-1)?.rawValue
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        rowSelected = row-1
        if(rowSelected >= 0){
            textField?.text = EnumTipoAnimal.getEnum(orderId: rowSelected)?.rawValue
        }else{
            textField?.text = "";
        }
        pickerViewRaca?.setSelected(raca: "", rowSelected: 0)
    }
    
    
    func prepare(textField:UITextField, controller:UIViewController,_ pickerViewRaca :PickerViewRaca?,enumTp:EnumTipoAnimal!) -> PickerViewTipoAnimal{
        self.delegate = self
        self.dataSource = self
        self.controller = controller
        self.textField = textField
        textField.inputView = self
        self.pickerViewRaca = pickerViewRaca
        
        var countEnum:Int = 0
        if(enumTp != nil ){
            for f in EnumUtil.iterateEnum(EnumTipoAnimal.self) {
                
                countEnum += 1
                
                if String(describing: f.self)==enumTp.rawValue as String{
                    self.selectRow(countEnum, inComponent: 0, animated: true)
                     DispatchQueue.main.async {
                        CallRest.requestGetList(url: "animal/racas/"+enumTp.rawValue ,callBack: self.preencherLista, callBackError: self.erro)
                    }
                    rowSelected = countEnum-1
                    enumAnimalSelected = EnumTipoAnimal.getEnum(orderId: rowSelected)
                }
            }
        }
        
        let doneButton = UIBarButtonItem(title: ParametrosUtil.Labels.namePickerDone, style: UIBarButtonItemStyle.plain, target: self, action: #selector(donePicker))
        
        textField.inputAccessoryView = ComponentsUtil.toolBarPicker(doneButton:doneButton)
     
        return self
    }
    
    func donePicker (sender:UIBarButtonItem)
    {
        controller?.view.endEditing(true)
        if(pickerViewRaca != nil){
            pickerViewRaca?.textField?.text = ""
            DispatchQueue.main.async {
                CallRest.requestGetList(url: "animal/racas/"+(EnumTipoAnimal.getEnum(orderId: self.rowSelected)?.rawValue)! ,callBack: self.preencherLista, callBackError: self.erro)
            }
            
        }
    }
    
    func preencherLista(json:[[String:AnyObject]]) -> Void{
       
        pickerViewRaca?.racas = JsonUtil.listByJson(Racas.self,json:json)
        DispatchQueue.main.async {
            self.pickerViewRaca?.reloadAllComponents()
            self.selectPickRaca()
        }
      
    }
    
    func erro(mapErro:MapErrorRetornoRest){
        //ComponentsUtil.backErrorRest(mapErro:mapErro,controller:self,progress:self.indicadorProgress)
        
    }
    
    func selectPickRaca(){
        
        if(self.pickerViewRaca?.preSelectedRaca != nil){
            var countLines:Int = 0
            
            for raca in (self.pickerViewRaca?.racas)!{
                countLines += 1
                if(raca.descricao?.description == self.pickerViewRaca?.preSelectedRaca){
                    
                    pickerViewRaca?.setSelected(raca: (raca.descricao?.description)!, rowSelected: countLines-1)
                }
                
            }
        }

    }
    
    
}
