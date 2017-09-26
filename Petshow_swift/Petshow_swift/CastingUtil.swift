//
//  CastingUtil.swift
//  Petshow_swift
//
//  Created by Bruno Salmito on 25/09/17.
//  Copyright © 2017 Bruno Salmito. All rights reserved.
//

import Foundation

class CastingUtil{
    
    static func returnNil<T:AnyObject>(_: T.Type) -> T?{
        return nil
    }
    static func boolToNSNumber (boolean:Bool?) -> NSNumber{
        if(boolean == nil){
            return NSNumber(integerLiteral: 0)
        }
        if(boolean == true){
            return NSNumber(integerLiteral: 1)
        }
        if(boolean == false){
            return NSNumber(integerLiteral: 0)
        }
        return NSNumber(integerLiteral: 0)
    }
   }
