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
        return row == 0 ? "" :racas[row-1].descricao as! String
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        rowSelected = row-1 // salvar com um a menos para ser igual o array pois no componente a primeira linha é vazia e o no array o primeiro ja tem valor
        textField?.text = racas[rowSelected].descricao as! String
        

    }
    
    func getSelecteRaca() -> String{
        
       return racas[rowSelected].descricao as! String
    }
    
    
    func prepare(textField:UITextField, controller:UIViewController,raca:String!) -> PickerViewRaca{
        self.delegate = self
        self.dataSource = self
        self.controller = controller
        self.textField = textField
        textField.inputView = self
        self.preSelectedRaca = raca
        
        
//        if(racas != nil){
//            
//            for item in racas{
//                if(item.descricao?.description == raca){
//                    self.selectRow((index as? Int)! + 1 , inComponent: 0, animated: true)
//                    break
//                }
//            }
// 
//        }
        
        
        let toolBar = UIToolbar()
        toolBar.barStyle = UIBarStyle.default
        toolBar.isTranslucent = true
        toolBar.tintColor = UIColor(red: 76/255, green: 217/255, blue: 100/255, alpha: 1)
        toolBar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "OK", style: UIBarButtonItemStyle.plain, target: self, action: #selector(donePicker))
        
        toolBar.setItems([doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        
        textField.inputAccessoryView = toolBar
        
        
        return self
    }
    
    
    func donePicker (sender:UIBarButtonItem)
    {
        controller?.view.endEditing(true)
    }


}
