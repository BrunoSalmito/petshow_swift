//
//  ComponentsUtil.swift
//  Petshow_swift
//
//  Created by Bruno Salmito on 21/09/17.
//  Copyright © 2017 Bruno Salmito. All rights reserved.
//

import UIKit

class ComponentsUtil{
    
    class func toolBarPicker(doneButton: UIBarButtonItem) ->UIToolbar{
                let toolBar = UIToolbar()
                toolBar.barStyle = UIBarStyle.default
                toolBar.isTranslucent = true
                toolBar.tintColor = UIColor(red: 76/255, green: 217/255, blue: 100/255, alpha: 1)
                toolBar.sizeToFit()
                toolBar.setItems([doneButton], animated: false)
                toolBar.isUserInteractionEnabled = true
        return toolBar
    }
    
    class func configurarTextField(textField:UITextField){
//        let border = CALayer()
//        let width = CGFloat(0.5)
//        border.borderColor = UIColor.gray.cgColor
//        border.frame = CGRect(x: 0, y: textField.frame.size.height - width, width:  textField.frame.size.width, height: textField.frame.size.height)
//        
//        border.borderWidth = width
//        textField.layer.addSublayer(border)
//        textField.layer.masksToBounds = true
    }
    
    
    //exemplo sender selector
//    class func toolBarPicker(selectorMethodDone: Selector) ->UIToolbar{
//        let toolBar = UIToolbar()
//        toolBar.barStyle = UIBarStyle.default
//        toolBar.isTranslucent = true
//        toolBar.tintColor = UIColor(red: 76/255, green: 217/255, blue: 100/255, alpha: 1)
//        toolBar.sizeToFit()
//        
//        let doneButton = UIBarButtonItem(title: "OK", style: UIBarButtonItemStyle.plain, target: self, action: selectorMethodDone)
//        
//        toolBar.setItems([doneButton], animated: false)
//        toolBar.isUserInteractionEnabled = true
//        return toolBar
//    }

    
    class func criationOptionSheet(controller:UIViewController,message:String,functionOk: @escaping ()-> Void,functionCancel: (()-> Void)?){
        
        let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        let okAction = UIAlertAction(title: message, style: UIAlertActionStyle.default) {
            UIAlertAction in
            functionOk()
        }
        let cancelAction = UIAlertAction(title: "Cancelar", style: UIAlertActionStyle.cancel) {
            UIAlertAction in
            if(functionCancel != nil){
                functionCancel!()
            }
        }
        
        alertController.addAction(okAction)
        alertController.addAction(cancelAction)
        
        
        controller.present(alertController, animated: true, completion: nil)
        
    }
    class func criationAlertOption(controller:UIViewController,title:String,message:String,functionOk: @escaping ()-> Void,functionCancel: (()-> Void)?){
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
        
        let okAction = UIAlertAction(title: "Sim", style: UIAlertActionStyle.default) {
            UIAlertAction in
            functionOk()
        }
        let cancelAction = UIAlertAction(title: "Não", style: UIAlertActionStyle.cancel) {
            UIAlertAction in
            if(functionCancel != nil){
                functionCancel!()
            }
        }
        
        alertController.addAction(okAction)
        alertController.addAction(cancelAction)
        
        
        controller.present(alertController, animated: true, completion: nil)
        
    }
    class func criationAlertWithActionOK(controller:UIViewController,title:String,message:String,functionOk: @escaping ()-> Void){
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "Sim", style: UIAlertActionStyle.default) {
            UIAlertAction in
            functionOk()
        }
        
        alertController.addAction(okAction)
        
        
        controller.present(alertController, animated: true, completion: nil)
        
    }
    class func criationAlert(controller:UIViewController,title:String,message:String){
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) {
            UIAlertAction in
            
        }
        alertController.addAction(okAction)
        
        controller.present(alertController, animated: true, completion: nil)
        
    }
    class func criationAlertValidation(controller:UIViewController,message:String){
        
        let alertController = UIAlertController(title: ParametrosUtil.Labels.titleAlertConfirmation, message: message, preferredStyle: UIAlertControllerStyle.alert)
        
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) {
            UIAlertAction in
            
        }
        alertController.addAction(okAction)
        
        controller.present(alertController, animated: true, completion: nil)
        
    }
    
    class func backErrorRest(mapErro:MapErrorRetornoRest,controller:UIViewController,progress:ActivityIndicadorViewPet?){
        
        if (mapErro.type == EnumErrosSistema.ERRO_VALIDACAO) {
            ComponentsUtil.criationAlertValidation(controller: controller, message: mapErro.message.description)
            if(progress != nil){
                progress?.close()
            }
        }
        
    }

    

}
