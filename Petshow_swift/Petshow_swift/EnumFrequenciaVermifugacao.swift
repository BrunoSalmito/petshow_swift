//
//  EnumFrequenciaVermifugacao.swift
//  Petshow_swift
//
//  Created by Bruno Salmito on 29/08/17.
//  Copyright © 2017 Bruno Salmito. All rights reserved.
//

import Foundation

enum EnumFrequenciaVermifugacao:String{
    case MENSAL,TRIMESTRAL,SEMESTRAL,ANUAL
    
    static let count:Int = {
        return EnumUtil.enumCount(EnumFrequenciaVermifugacao)
    }()
    
    
    static func getEnum(orderId:Int)-> EnumFrequenciaVermifugacao?{
        
        for enumAux in EnumUtil.iterateEnum(EnumFrequenciaVermifugacao) {
            
            if enumAux.orderId == orderId {
                
                return enumAux
            }
        }
        return nil
    }
    func getEnum(id:Int)-> EnumFrequenciaVermifugacao? {
        
        for enumAux in EnumUtil.iterateEnum(EnumFrequenciaVermifugacao) {
            
            if enumAux.id == id {
                
                return enumAux
            }
        }
        return nil
    }
    
    var id: Int {
        switch self {
            
        case .MENSAL: return 1
        case .TRIMESTRAL: return 2
        case .SEMESTRAL: return 3
        case .ANUAL: return 4
        }
    }
    
    var orderId: Int {
        switch self {
            
        case .MENSAL: return 0
        case .TRIMESTRAL: return 1
        case .SEMESTRAL: return 2
        case .ANUAL: return 3
            
            
            
        }
    }
    
    var desc: String {
        switch self {
            
        case .MENSAL: return "Mensal"
        case .TRIMESTRAL: return "Trimestral"
        case .SEMESTRAL: return "Semestral"
        case .ANUAL: return "Anual"
            
            
            
        }
    }


}
