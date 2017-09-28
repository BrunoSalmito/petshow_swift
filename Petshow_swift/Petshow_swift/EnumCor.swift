//
//  EnumCor.swift
//  Petshow_swift
//
//  Created by Bruno Salmito on 05/09/17.
//  Copyright © 2017 Bruno Salmito. All rights reserved.
//

import Foundation

enum EnumCor:String{
    case PRETO,BRANCO,MARRON,AMARELO
    
    static let count:Int = {
        return EnumUtil.enumCount(EnumCor.self)
    }()
    
    static func getEnum(orderId:Int)-> EnumCor?{
        
        for enumAux in EnumUtil.iterateEnum(EnumCor.self) {
            
            if enumAux.orderId == orderId {
                
                return enumAux
            }
        }
        
        return nil
    }
    static func getEnum(id:Int)-> EnumCor? {
        
        for enumAux in EnumUtil.iterateEnum(EnumCor.self) {
            
            if enumAux.id == id {
                
                return enumAux
            }
        }
        return nil
    }
    
    var id: Int {
        switch self {
            
        case .PRETO: return 1
        case .BRANCO: return 2
        case .MARRON: return 3
        case .AMARELO: return 4
  
            
        }
    }
    
    var orderId: Int {
        switch self {
            
        case .PRETO: return 0
        case .BRANCO: return 1
        case .MARRON: return 2
        case .AMARELO: return 3
        }
    }

}
