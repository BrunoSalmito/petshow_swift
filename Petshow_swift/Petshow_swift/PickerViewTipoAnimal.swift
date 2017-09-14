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
    
        func numberOfComponents(in pickerView: UIPickerView) -> Int {
            return 1
        }
    
        func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
            return EnumTipoAnimal.count+1
        }
    
        func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
            return row == 0 ? "" :EnumTipoAnimal.getEnum(numero: row-1).rawValue
        }
    
        func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
            
            rowSelected = row-1
            if(rowSelected >= 0){
                textField?.text = EnumTipoAnimal.getEnum(numero: rowSelected).rawValue
            }else{
                 textField?.text = "";
            }
        }
        
        
    func prepare(textField:UITextField, controller:UIViewController,_ pickerViewRaca :PickerViewRaca?) -> PickerViewTipoAnimal{
        self.delegate = self
        self.dataSource = self
        self.controller = controller
        self.textField = textField
        textField.inputView = self
        self.pickerViewRaca = pickerViewRaca
        
        
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
        if(pickerViewRaca != nil){
            CallRest.requestGetList(url: "animal/racas/"+EnumTipoAnimal.getEnum(numero: rowSelected).rawValue ,callBack: self.preencherLista, callBackError: self.erroLista)
            
            
        }
    }
    
    func preencherLista(json:[[String:AnyObject]]) -> Void{
        pickerViewRaca?.racas.removeAll()
        for item in json{
            let novoItem = Racas()
            novoItem.setValuesForKeys(item)
            pickerViewRaca?.racas.append(novoItem)
        }
        
        DispatchQueue.main.sync {
            pickerViewRaca?.reloadAllComponents()
        }
    }
    
    func erroLista(mapErro:MapErrorRetornoRest){
        print("erro chamada")
        print("erro chamada")
        
    }
    
    }
