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
        if(txt.text == nil || txt.text == ""){
            return false
        }
        return true
    }
}
