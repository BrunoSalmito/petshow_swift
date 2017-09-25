//
//  MapErrorRetornoRest.swift
//  PetshowTeste
//
//  Created by Bruno Salmito on 21/06/17.
//  Copyright © 2017 Bruno Salmito. All rights reserved.
//

import Foundation


class MapErrorRetornoRest:NSObject{
    var type:EnumErrosSistema!
    var message:NSString!
    var rootCause:NSString!
    var rootMessage:NSString!
    var fields:[NSString]!
    
    override func setValue(_ value: Any?, forKey key: String) {
        if key=="type" {
            self.type = EnumUtil.getInListEnum(EnumErrosSistema.self ,  value )
            
            
        }else{
            
            super.setValue(value, forKey: key)
        }
        
        
        
    }
    
    func toJSON() -> Dictionary<String, AnyObject> {
        return [
            
            "message":self.message  as AnyObject          ,
            "rootCause":self.rootCause as AnyObject,
            "rootMessage":self.rootMessage as AnyObject,
            "fields":self.fields as AnyObject//,
            //"type":self.type as AnyObject
            
        ]
    }


    
}
