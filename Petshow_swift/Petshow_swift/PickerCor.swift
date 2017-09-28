//
//  PickerCor.swift
//  Petshow_swift
//
//  Created by Bruno Salmito on 27/09/17.
//  Copyright © 2017 Bruno Salmito. All rights reserved.
//

import Foundation

import UIKit

class PickerCor: UIPickerView,UIPickerViewDataSource, UIPickerViewDelegate {
    
    
    var textField:UITextField?
    var controller:UIViewController?
    var rowSelected = -1
    var enumSelected:EnumCor?
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return EnumCor.count+1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return  row == 0 ? "" :EnumCor.getEnum(orderId: row-1)?.rawValue
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        rowSelected = row-1
        if(rowSelected >= 0){
            textField?.text = EnumCor.getEnum(orderId: rowSelected)?.rawValue
        }else{
            textField?.text = "";
        }

    }
    
    
    func prepare(textField:UITextField, controller:UIViewController,enumTp:EnumCor?) -> PickerCor{
        self.delegate = self
        self.dataSource = self
        self.controller = controller
        self.textField = textField
        textField.inputView = self
        
        var countEnum:Int = 0
        if(enumTp != nil ){
            for f in EnumUtil.iterateEnum(EnumCor.self) {
                
                countEnum += 1
                
                if f.id==enumTp?.id {
                    self.selectRow(countEnum, inComponent: 0, animated: true)
                    rowSelected = countEnum-1
                    enumSelected = EnumCor.getEnum(orderId: rowSelected)
                    textField.text = enumSelected?.rawValue

                }
                
            }
        }else{
            self.selectRow(0, inComponent: 0, animated: true)
            textField.text = ""
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
