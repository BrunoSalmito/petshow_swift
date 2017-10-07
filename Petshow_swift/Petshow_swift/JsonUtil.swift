//
//  JsonUtil.swift
//  Petshow_swift
//
//  Created by Bruno Salmito on 24/09/17.
//  Copyright © 2017 Bruno Salmito. All rights reserved.
//

import Foundation
class JsonUtil{
    
    class func setfieldsJsonReturn<T:Entidade>(entidade: T, json:[String: AnyObject]) {
        
        
        entidade.setValuesForKeys(json)
        
    }
    static func listByJson<T:Entidade>(_: T.Type,json:[[String:AnyObject]]) -> [T]{
        var entidades = [T]()
        
        for item in json{
            let newItem = T()
            newItem.setValuesForKeys(item)
            entidades.append(newItem)
            
        }
        return entidades
    }
    static func entidadeByJsonNew<T:Entidade>(_: T.Type,json:[String:AnyObject]) -> T{
        let entidade = T()
        entidade.setValuesForKeys(json)
        
        return entidade
    }
    
    static func entidadeByJson<T:Entidade>(_: T.Type,json:[String:AnyObject],entidade:T) -> T{
        
        entidade.setValuesForKeys(json)
        
        return entidade
    }
    
    static func listByJsonResponseMap<T:NSObject>(_: T.Type,json:[[String:AnyObject]]) -> [T]{
        var entidades = [T]()
        
        for item in json{
            let newItem = T()
            newItem.setValuesForKeys(item)
            entidades.append(newItem)
            
        }
        return entidades
    }
}
