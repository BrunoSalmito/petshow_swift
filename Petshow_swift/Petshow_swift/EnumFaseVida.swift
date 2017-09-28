//
//  EnumFaseVida.swift
//  Petshow_swift
//
//  Created by Bruno Salmito on 05/09/17.
//  Copyright © 2017 Bruno Salmito. All rights reserved.
//

import Foundation

enum EnumFaseVida:String{
    case FILHOTE,ADULTO,IDOSO
    
    static let count:Int = {
        return EnumUtil.enumCount(EnumFaseVida.self)
    }()
    
    static func getEnum(orderId:Int)-> EnumFaseVida?{
        
        for enumAux in EnumUtil.iterateEnum(EnumFaseVida.self) {
            
            if enumAux.orderId == orderId {
                
                return enumAux
            }
        }
        
        return nil
    }
    static func getEnum(id:Int)-> EnumFaseVida? {
        
        for enumAux in EnumUtil.iterateEnum(EnumFaseVida.self) {
            
            if enumAux.id == id {
                
                return enumAux
            }
        }
        return nil
    }
    
    var id: Int {
        switch self {
            
        case .FILHOTE: return 1
        case .ADULTO: return 2
        case .IDOSO: return 3
            
        }
    }
    
    var orderId: Int {
        switch self {
            
        case .FILHOTE: return 0
        case .ADULTO: return 1
        case .IDOSO: return 2
            
        }
    }

}
