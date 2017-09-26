//
//  PickerFrequenciaVermifugacao.swift
//  Petshow_swift
//
//  Created by Bruno Salmito on 21/09/17.
//  Copyright © 2017 Bruno Salmito. All rights reserved.
//

import UIKit

class PickerFrequenciaVermifugacao: UIPickerView,UIPickerViewDataSource, UIPickerViewDelegate {
    
    
    var textField:UITextField?
    var controller:UIViewController?
    var rowSelected = -1
    var enumSelected : EnumFrequenciaVermifugacao?
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return EnumFrequenciaVermifugacao.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        return EnumFrequenciaVermifugacao.getEnum(orderId: row )?.desc
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        rowSelected = row
        enumSelected = EnumFrequenciaVermifugacao.getEnum(orderId: rowSelected)
        textField?.text = enumSelected?.desc
       
    }
    
    
    func prepare(textField:UITextField, controller:UIViewController,enumTp:EnumFrequenciaVermifugacao?) -> PickerFrequenciaVermifugacao{
        self.delegate = self
        self.dataSource = self
        self.controller = controller
        self.textField = textField
        textField.inputView = self
        
        var countEnum:Int = 0
        if(enumTp != nil ){
            for f in EnumUtil.iterateEnum(EnumFrequenciaVermifugacao) {
                 if f.id==enumTp?.id {
                    self.selectRow(countEnum, inComponent: 0, animated: true)
                    textField.text = f.desc
                    rowSelected = countEnum
                }
                countEnum += 1
            }
        }else{
            self.selectRow(0, inComponent: 0, animated: true)
            textField.text = EnumFrequenciaVermifugacao.getEnum(orderId: 0)?.desc
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
