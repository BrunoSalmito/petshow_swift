//
//  Entidade.swift
//  PetshowTeste
//
//  Created by Bruno Salmito on 14/06/17.
//  Copyright © 2017 Bruno Salmito. All rights reserved.
//

import Foundation

class Entidade:NSObject{
    
    var id:NSNumber?
    
    func toJSON() -> Dictionary<String, AnyObject> {
        return ["id":self.id  as AnyObject]
    }
    required override init() {
        super.init()
    }
    }
