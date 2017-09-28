//
//  PickerSexo.swift
//  Petshow_swift
//
//  Created by Bruno Salmito on 28/09/17.
//  Copyright © 2017 Bruno Salmito. All rights reserved.
//

import UIKit

class PickerSexo: UIPickerView,UIPickerViewDataSource, UIPickerViewDelegate {
    
    
    var textField:UITextField?
    var controller:UIViewController?
    var rowSelected = -1
    var sexoSelected:String?
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return EnumSexo.count+1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return  row == 0 ? "" :EnumSexo.getEnum(orderId: row-1)?.rawValue
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        rowSelected = row-1
        if(rowSelected >= 0){
            textField?.text = EnumSexo.getEnum(orderId: rowSelected)?.rawValue
        }else{
            textField?.text = "";
        }
        
    }
    
    
    func prepare(textField:UITextField, controller:UIViewController,enumTp:String?) -> PickerSexo{
        self.delegate = self
        self.dataSource = self
        self.controller = controller
        self.textField = textField
        textField.inputView = self
        
        var countEnum:Int = 0
        if(enumTp != nil ){
            for f in EnumUtil.iterateEnum(EnumSexo.self) {
                
                countEnum += 1
                
                if f.desc == enumTp {
                    self.selectRow(countEnum, inComponent: 0, animated: true)
                    rowSelected = countEnum-1
                    sexoSelected = EnumSexo.getEnum(orderId: rowSelected)?.desc
                    textField.text = EnumSexo.getEnum(orderId: rowSelected)?.rawValue
                    
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
    
    func donePicker (sender:UIBarButtonItem)
    {
        controller?.view.endEditing(true)
    }
    
    
}
