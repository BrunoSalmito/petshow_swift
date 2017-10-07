//
//  LikesResponses.swift
//  Petshow_swift
//
//  Created by Bruno Salmito on 04/10/17.
//  Copyright © 2017 Bruno Salmito. All rights reserved.
//

import Foundation


class LikesResponses:NSObject{
    
    var idUsuario:NSNumber?
    var seguindo:Bool?
    var foto:NSString?
    var nome:NSString?
    var descAnimais:NSString?
    
    override func setValue(_ value: Any?, forKey key: String) {
        if key=="seguindo" {
            self.seguindo = value as? Bool
            
        }else{
            super.setValue(value, forKey: key)
            
        }
        
    }
    
    required override init() {
        super.init()
    }
}
