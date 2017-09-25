//
//  DatePickerFrequenciaTratamento.swift
//  Petshow_swift
//
//  Created by Bruno Salmito on 19/09/17.
//  Copyright © 2017 Bruno Salmito. All rights reserved.
//

import UIKit

class PickerFrequenciaTratamento: UIPickerView,UIPickerViewDataSource, UIPickerViewDelegate {
    
    
    var textField:UITextField?
    var controller:UIViewController?
    var rowSelected = -1
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return EnumFrequenciaTratamento.count+1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return row == 0 ? "" :EnumFrequenciaTratamento.getEnum(orderId: row-1)?.desc
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        rowSelected = row-1
        if(rowSelected >= 0){
            textField?.text = EnumFrequenciaTratamento.getEnum(orderId: rowSelected)?.desc
        }else{
            textField?.text = "";
        }
    }
    
    
    func prepare(textField:UITextField, controller:UIViewController,enumTp:EnumFrequenciaTratamento?) -> PickerFrequenciaTratamento{
        self.delegate = self
        self.dataSource = self
        self.controller = controller
        self.textField = textField
        textField.inputView = self
        
        var countEnum:Int = 0
        if(enumTp != nil ){
            for f in EnumUtil.iterateEnum(EnumFrequenciaTratamento) {
                
                countEnum += 1
                
                if f.id==enumTp?.id {
                    self.selectRow(countEnum, inComponent: 0, animated: true)
                    textField.text = f.desc
                }
            }
        }

        let doneButton = UIBarButtonItem(title: ParametrosUtil.Labels.namePickerDone, style: UIBarButtonItemStyle.plain, target: self, action: #selector(donePicker))
        
        textField.inputAccessoryView = ComponentsUtil.toolBarPicker(doneButton:doneButton)
        //textField.addTarget(self, action: #selector(bloquear), for: UIControlEvents.editingDidBegin)
        //textField.addTarget(self, action: #selector(desbloquear), for: UIControlEvents.editingDidEnd)
        
        
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
