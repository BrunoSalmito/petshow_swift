//
//  Tutor.swift
//  Petshow_swift
//
//  Created by Bruno Salmito on 18/09/17.
//  Copyright © 2017 Bruno Salmito. All rights reserved.
//

import Foundation

class Tutor:Entidade{
    
    var   usuario:Usuario?
    var   animal:Animal?
    var   donoAtual:Bool?
    
    
    override func setValue(_ value: Any?, forKey key: String) {
        if (key == "donoAtual") {
            self.donoAtual = value as? Bool
        }else{
            super.setValue(value, forKey: key)
        }
         
    }
    
    override func toJSON() -> Dictionary<String, AnyObject> {
        
        return[
            "id":(self.id  as AnyObject),
            "usuario":(self.usuario?.toJSON()  as AnyObject),
            "animal":(self.animal?.toJSON()  as AnyObject),
            "donoAtual":(self.donoAtual  as AnyObject)
        ]
    }
}
