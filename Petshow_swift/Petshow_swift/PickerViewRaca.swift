//
//  PickerViewRaca.swift
//  Petshow_swift
//
//  Created by Bruno Salmito on 11/09/17.
//  Copyright © 2017 Bruno Salmito. All rights reserved.
//

import UIKit

class PickerViewRaca: UIPickerView,UIPickerViewDataSource, UIPickerViewDelegate {
    
    
    var textField:UITextField?
    var controller:UIViewController?
    var rowSelected = -1
    var racas = [Racas()]
    var preSelectedRaca:String!
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return racas.count+1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return row == 0 ? "" :racas[row-1].descricao?.description
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        rowSelected = row-1
        if(rowSelected >= 0){
            textField?.text = racas[rowSelected].descricao?.description
        }else{
            textField?.text = ""
        }

    }
    func getSelectedRaca() ->NSString?{
        return racas[rowSelected].descricao
    }
    
    func prepare(textField:UITextField, controller:UIViewController,raca:String!) -> PickerViewRaca{
        self.delegate = self
        self.dataSource = self
        self.controller = controller
        self.textField = textField
        textField.inputView = self
        self.preSelectedRaca = raca
        
        let doneButton = UIBarButtonItem(title: ParametrosUtil.Labels.namePickerDone, style: UIBarButtonItemStyle.plain, target: self, action: #selector(donePicker))
        
        textField.inputAccessoryView = ComponentsUtil.toolBarPicker(doneButton:doneButton)
        
        
        return self
    }
    
    
    func donePicker (sender:UIBarButtonItem)
    {
        controller?.view.endEditing(true)
    }

    func setSelected(raca:String,rowSelected:Int){
        self.preSelectedRaca = raca
        self.rowSelected = rowSelected
        
        self.selectRow(rowSelected, inComponent: 0, animated: true)
        
    }
    

}
