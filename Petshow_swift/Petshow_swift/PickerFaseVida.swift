//
//  PickerFaseVida.swift
//  Petshow_swift
//
//  Created by Bruno Salmito on 27/09/17.
//  Copyright © 2017 Bruno Salmito. All rights reserved.
//

import UIKit

class PickerFaseVida: UIPickerView,UIPickerViewDataSource, UIPickerViewDelegate {
    
    
    var textField:UITextField?
    var controller:UIViewController?
    var rowSelected = -1
    var enumSelected:EnumFaseVida?
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return EnumPorteAnimal.count+1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return  EnumPorteAnimal.getEnum(orderId: row)?.rawValue
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        rowSelected = row
        enumSelected = EnumFaseVida.getEnum(orderId: rowSelected)
        textField?.text = enumSelected?.rawValue
    }
    
    
    func prepare(textField:UITextField, controller:UIViewController,enumTp:EnumFaseVida?) -> PickerFaseVida{
        self.delegate = self
        self.dataSource = self
        self.controller = controller
        self.textField = textField
        textField.inputView = self
        
        var countEnum:Int = 0
        if(enumTp != nil ){
            for f in EnumUtil.iterateEnum(EnumFaseVida.self) {
                
                
                
                if f.id==enumTp?.id {
                    self.selectRow(countEnum, inComponent: 0, animated: true)
                    textField.text = f.rawValue
                    enumSelected = f
                }
                countEnum += 1
            }
        }else{
            self.selectRow(0, inComponent: 0, animated: true)
            textField.text = EnumFrequenciaTratamento.getEnum(orderId: 0)?.desc
            rowSelected = 0
        }
        
        let doneButton = UIBarButtonItem(title: ParametrosUtil.Labels.namePickerDone, style: UIBarButtonItemStyle.plain, target: self, action: #selector(donePicker))
        
        textField.inputAccessoryView = ComponentsUtil.toolBarPicker(doneButton:doneButton)
        
        
        return self
    }
    func bloquear (sender: UITextField){
        sender.isUserInteractionEnabled = false
    }
    func desbloquear (sender: UITextField){
        sender.isUserInteractionEnabled = true
    }
    
    func donePicker (sender:UIBarButtonItem)
    {
        controller?.view.endEditing(true)
    }
    
    
}
