//
//  DatePickerData.swift
//  Petshow_swift
//
//  Created by Bruno Salmito on 12/09/17.
//  Copyright © 2017 Bruno Salmito. All rights reserved.
//

import Foundation

import UIKit

class DatePickerData:NSObject {
    
    
    
    func prepare (controller:UIViewController, txt:UITextField, tpData:UIDatePickerMode,idDatePickerTela:Int!) {
        
        
        let inputView = UIView(frame: CGRect(x: 0, y: 0, width: controller.view.frame.width, height: 200))
        let datePickerView  : UIDatePicker = UIDatePicker(frame: CGRect(x: 0, y: 40, width: 0, height: 0))
        
        datePickerView.datePickerMode = tpData
       
        inputView.addSubview(datePickerView)
        
        setDatePickerTag(datePickerView: datePickerView, idDatePickerTela: idDatePickerTela)
    
        if(tpData == UIDatePickerMode.time){
            datePickerView.locale = NSLocale(localeIdentifier: "da_DK") as Locale
        }
   
        inputView.addSubview(createDoneButton(controller:controller))
        
        
        txt.inputView = inputView
        datePickerView.addTarget(controller, action: #selector(handleDatePicker), for: UIControlEvents.valueChanged)
        
        setDateFromTextFieldToDate(txt: txt, tpData: tpData, datePickerView: datePickerView)
       
        handleDatePicker(sender: datePickerView)
        
      
    }
    
    
    func setDatePickerTag(datePickerView  : UIDatePicker,idDatePickerTela:Int!){
        if(idDatePickerTela == nil){
            datePickerView.tag = 1
        }else{
            datePickerView.tag = idDatePickerTela!
        }
    }
    
    func setDateFromTextFieldToDate(txt:UITextField , tpData:UIDatePickerMode ,datePickerView  : UIDatePicker){
        
        if(txt.text?.description != ""){
            if(tpData == UIDatePickerMode.date){
                datePickerView.setDate(DateUtil.dataBrasilToDate(date: (txt.text?.description)!), animated: true)
            }else{
                datePickerView.setDate(DateUtil.hourDescToDate(hour: (txt.text?.description)!, seconds: false), animated: true)
            }
        }else{
           txt.text = DateUtil.formartarDataBrasil(date: datePickerView.date)
        }
    }
    
    //  implementar em quem chama
    func handleDatePicker(sender: UIDatePicker)
    {
        
    }
    //  implementar em quem chama
    func doneButtonAction(sender:UIButton)
    {
        
    }
    func createDoneButton(controller:UIViewController)-> UIButton{
        let doneButton = UIButton(frame:  CGRect(x: (controller.view.frame.size.width) - (100), y: 0, width: 100, height: 50))
        doneButton.setTitle("OK", for: UIControlState.normal)
        doneButton.setTitle("OK", for: UIControlState.highlighted)
        doneButton.setTitleColor(UIColor.black, for: UIControlState.normal)
        doneButton.setTitleColor(UIColor.gray, for: UIControlState.highlighted)
        doneButton.addTarget(controller, action: #selector(doneButtonAction), for: UIControlEvents.touchUpInside)
        return doneButton
    }
    
}

