//
//  ValidationUtil.swift
//  Petshow_swift
//
//  Created by Bruno Salmito on 24/09/17.
//  Copyright © 2017 Bruno Salmito. All rights reserved.
//

import UIKit

class ValidationUtil {
    // sempre retornar falso quando der algum erro na validacao
    static func validationTextFieldData(txt:UITextField) -> Bool{
        if(!validarStringEmpty(text:txt.text)){
            return false
        }
        //criar outras validacoes
        return true
    }
    static func validationTextFieldString(txt:UITextField) -> Bool{
        return validarStringEmpty(text:txt.text)
    }
    
    static func validationTextViewString(txt:UITextView) -> Bool{
        
        return validarStringEmpty(text:txt.text)
    }
    
    static func validarStringEmpty(text:String?) -> Bool{
        if(text == nil || text == ""){
            return false
        }
        return true
    }
    
    static func validationNumber(number:Int?) -> Bool{
        if(number == nil || number == 0){
            return false
        }
        return true
    }
    
    static func validationNumber(number:NSNumber?) -> Bool{
        return validationNumber(number:number?.intValue)
    }
}
