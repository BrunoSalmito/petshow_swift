//
//  PickerViewVacina.swift
//  Petshow_swift
//
//  Created by Bruno Salmito on 16/09/17.
//  Copyright © 2017 Bruno Salmito. All rights reserved.
//

import UIKit

class PickerViewVacina: UIPickerView,UIPickerViewDataSource, UIPickerViewDelegate {
    
    
    var textField:UITextField?
    var controller:UIViewController?
    var rowSelected = -1
    var listEnumVacina:[EnumVacina] = []
    var enumVacinaSelected:EnumVacina?
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return listEnumVacina.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return listEnumVacina[row].nome
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        rowSelected = row
        if(rowSelected >= 0){
            textField?.text = listEnumVacina[row].nome
        }else{
            textField?.text = "";
        }
        
        enumVacinaSelected = listEnumVacina[row]
    }
    
    
    func prepare(textField:UITextField, controller:UIViewController,enumTpAnimal:EnumTipoAnimal,enumVacina:EnumVacina?) -> PickerViewVacina{
        self.delegate = self
        self.dataSource = self
        self.controller = controller
        self.textField = textField
        textField.inputView = self
        
        listEnumVacina = EnumVacina.getListEnumByTypeAnimal(enumTipoAnimal: enumTpAnimal)!
        
        self.reloadAllComponents();
        
        if(enumVacina != nil){
            var auxCount = 0
            for item in listEnumVacina{
                
                if(item == enumVacina){
                    textField.text = listEnumVacina[auxCount].nome
                    rowSelected = auxCount
                    self.selectRow(auxCount , inComponent: 0, animated: true)
                    enumVacinaSelected = listEnumVacina[auxCount]
                }
                auxCount += 1
            }
        }
        let doneButton = UIBarButtonItem(title: ParametrosUtil.Labels.namePickerDone, style: UIBarButtonItemStyle.plain, target: self, action: #selector(donePicker))
        
        textField.inputAccessoryView = ComponentsUtil.toolBarPicker(doneButton:doneButton)
        
        
        return self
    }
   
    func donePicker (sender:UIBarButtonItem)
    {
        controller?.view.endEditing(true)
    }
    
    
}
