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
    
    
    
    func prepare (controller:UIViewController, txt:UITextField, tpData:UIDatePickerMode) {
        
        
        let inputView = UIView(frame: CGRect(x: 0, y: 0, width: controller.view.frame.width, height: 200))
        var datePickerView  : UIDatePicker = UIDatePicker(frame: CGRect(x: 0, y: 40, width: 0, height: 0))
        datePickerView.datePickerMode = tpData
        inputView.addSubview(datePickerView)
        
        let doneButton = UIButton(frame:  CGRect(x: (controller.view.frame.size.width) - (100), y: 0, width: 100, height: 50))
        doneButton.setTitle("OK", for: UIControlState.normal)
        doneButton.setTitle("OK", for: UIControlState.highlighted)
        doneButton.setTitleColor(UIColor.black, for: UIControlState.normal)
        doneButton.setTitleColor(UIColor.gray, for: UIControlState.highlighted)
        
        inputView.addSubview(doneButton) // add Button to UIView
        
        doneButton.addTarget(controller, action: #selector(doneButtonAction), for: UIControlEvents.touchUpInside) // set button click event
        
        txt.inputView = inputView
        datePickerView.addTarget(controller, action: #selector(handleDatePicker), for: UIControlEvents.valueChanged)
        
        handleDatePicker(sender: datePickerView) // Set the date on start.
        
    }
    
    
    //  implementar em quem chama
    func handleDatePicker(sender: UIDatePicker)
    {
        
    }
    //  implementar em quem chama
    func doneButtonAction(sender:UIButton)
    {
        
    }
    
    
}

