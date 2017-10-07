//
//  ComFotoTutor.swift
//  Petshow_swift
//
//  Created by Bruno Salmito on 02/10/17.
//  Copyright © 2017 Bruno Salmito. All rights reserved.
//

import Foundation

class ComFotoTutor:Comentario{
    
    var tutor:Tutor?
    
    
    override func toJSON()  -> Dictionary<String, AnyObject>  {
        var retorno:Dictionary<String, AnyObject> = super.toJSON()
        
        retorno["tutor"] = (self.tutor?.toJSON()  as AnyObject)
        return retorno
    }
    
}
