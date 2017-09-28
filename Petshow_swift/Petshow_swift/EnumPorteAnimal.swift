//
//  EnumPorteAnimal.swift
//  Petshow_swift
//
//  Created by Bruno Salmito on 05/09/17.
//  Copyright © 2017 Bruno Salmito. All rights reserved.
//

import Foundation
enum EnumPorteAnimal:String{
    case PEQUENO,MEDIO,GRANDE
    
    static let count:Int = {
        return EnumUtil.enumCount(EnumPorteAnimal.self)
    }()
    
    static func getEnum(orderId:Int)-> EnumPorteAnimal?{
        
        for enumAux in EnumUtil.iterateEnum(EnumPorteAnimal.self) {
            
            if enumAux.orderId == orderId {
                
                return enumAux
            }
        }
        
        return nil
    }
    static func getEnum(id:Int)-> EnumPorteAnimal? {
        
        for enumAux in EnumUtil.iterateEnum(EnumPorteAnimal.self) {
            
            if enumAux.id == id {
                
                return enumAux
            }
        }
        return nil
    }
    
    var id: Int {
        switch self {
            
        case .PEQUENO: return 1
        case .MEDIO: return 2
        case .GRANDE: return 3
       
        }
    }
    
    var orderId: Int {
        switch self {
            
        case .PEQUENO: return 0
        case .MEDIO: return 1
        case .GRANDE: return 2
         
        }
    }

}
