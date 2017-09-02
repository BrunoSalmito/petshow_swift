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
    func iterateEnum<T: Hashable>(_: T.Type) -> AnyIterator<T> {
        var i = 0
        return AnyIterator {
            let next = withUnsafeBytes(of: &i) { $0.load(as: T.self) }
            if next.hashValue != i { return nil }
            i += 1
            return next
        }
    }
}
