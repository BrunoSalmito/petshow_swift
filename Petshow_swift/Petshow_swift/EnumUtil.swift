//
//  EnumUtil.swift
//  Petshow_swift
//
//  Created by Bruno Salmito on 15/09/17.
//  Copyright © 2017 Bruno Salmito. All rights reserved.
//

import Foundation

class EnumUtil{
    class func iterateEnum<T: Hashable>(_: T.Type ) -> AnyIterator<T> {
        var i = 0
        return AnyIterator {
            let next = withUnsafeBytes(of: &i) { $0.load(as: T.self) }
            if next.hashValue != i { return nil }
            i += 1
            return next
        }
    }
    
    class func enumCount<T: Hashable>(_: T.Type) -> Int{
        
        var auxCount:Int = 0
        
        for f in EnumUtil.iterateEnum(T) {
            
            auxCount += 1
        }
        return auxCount
        
        
    }
    class func getInListEnum<T: Hashable>(_: T.Type,_ enumString:Any?) -> T?{
        if(enumString != nil){
            
            for f in EnumUtil.iterateEnum(T) {
                
                if String(describing: f.self) == enumString as! String {
                    
                    return f
                }
            }
        }
        return nil
        
    }
    
    
}
