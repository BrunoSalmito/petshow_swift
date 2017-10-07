//
//  AnimalPostResponse.swift
//  Petshow_swift
//
//  Created by Bruno Salmito on 07/10/17.
//  Copyright © 2017 Bruno Salmito. All rights reserved.
//

import Foundation

class AnimalPostResponse:NSObject{
    
    var idAnimal:NSNumber?
    var marcado:Bool?
    var nome:NSString?
    
    override func setValue(_ value: Any?, forKey key: String) {
        if key=="marcado" {
            self.marcado = value as? Bool
            
        }else{
            super.setValue(value, forKey: key)
            
        }
        
    }
    
    required override init() {
        super.init()
        marcado = false
    }
}

