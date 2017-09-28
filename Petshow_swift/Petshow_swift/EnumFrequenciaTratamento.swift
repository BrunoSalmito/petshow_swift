//
//  EnumFrequenciaTratamento.swift
//  Petshow_swift
//
//  Created by Bruno Salmito on 14/09/17.
//  Copyright © 2017 Bruno Salmito. All rights reserved.
//

import Foundation
enum EnumFrequenciaTratamento:String{
    case H_3_3,  H_4_4  ,H_6_6  ,H_8_8,H_12_12,DIARIA,D_3_3,D_5_5,SEMANAL,D_10_10,D_15_15,D_21_21,MENSAL,ETERNA_DIARIA,ETERNA_SEMANAL,ETERNA_QUINZENAL,ETERNA_MENSAL,ETERNA_TRIMESTRAL,ETERNA_SEMESTRAL,ETERNA_ANUAL
    
    static let count:Int = {
           return EnumUtil.enumCount(EnumFrequenciaTratamento.self)
    }()
    
    
    static func getEnum(orderId:Int)-> EnumFrequenciaTratamento?{
       
        for enumAux in EnumUtil.iterateEnum(EnumFrequenciaTratamento.self) {
            
            if enumAux.orderId == orderId {
                
                return enumAux
            }
        }
        return nil
    }
    func getEnum(id:Int)-> EnumFrequenciaTratamento? {
        
        for enumAux in EnumUtil.iterateEnum(EnumFrequenciaTratamento.self) {
            
            if enumAux.id == id {
                
                return enumAux
            }
        }
        return nil
    }
    
//    func getEnum(enumFrequenciaTratamento:EnumFrequenciaTratamento)-> EnumFrequenciaTratamento?{
//      
//       
//        for f in EnumUtil.iterateEnum(EnumFrequenciaTratamento) {
//            
//            if String(describing: f.self)==enumFrequenciaTratamento as? String{
//                
//                return f;
//            }
//        }
//        return nil
//    }

    
    
    var id: Int {
        switch self {

        case .H_3_3: return 1
        case .H_4_4: return 2
        case .H_6_6: return 3
        case .H_8_8: return 4
        case .H_12_12: return 5
        case .DIARIA: return 6
        case .D_3_3: return 7
        case .D_5_5: return 8
        case .SEMANAL: return 9
        case .D_10_10: return 10
        case .D_15_15: return 11
        case .D_21_21: return 12
        case .MENSAL: return 13
        case .ETERNA_DIARIA: return 50
        case .ETERNA_SEMANAL: return 51
        case .ETERNA_QUINZENAL: return 52
        case .ETERNA_MENSAL: return 53
        case .ETERNA_TRIMESTRAL: return 54
        case .ETERNA_SEMESTRAL: return 55
        case .ETERNA_ANUAL: return 56
            
            
        }
    }
    
    
    var orderId: Int {
        switch self {
            
        case .H_3_3: return 0
        case .H_4_4: return 1
        case .H_6_6: return 2
        case .H_8_8: return 3
        case .H_12_12: return 4
        case .DIARIA: return 5
        case .D_3_3: return 6
        case .D_5_5: return 7
        case .SEMANAL: return 8
        case .D_10_10: return 9
        case .D_15_15: return 10
        case .D_21_21: return 11
        case .MENSAL: return 12
        case .ETERNA_DIARIA: return 13
        case .ETERNA_SEMANAL: return 14
        case .ETERNA_QUINZENAL: return 15
        case .ETERNA_MENSAL: return 16
        case .ETERNA_TRIMESTRAL: return 17
        case .ETERNA_SEMESTRAL: return 18
        case .ETERNA_ANUAL: return 19
            
            
        }
    }

    
    var desc: String {
        switch self {
            
        case .H_3_3: return "De 3 em 3 horas"
        case .H_4_4: return "De 4 em 4 horas"
        case .H_6_6: return "De 6 em 6 horas"
        case .H_8_8: return "De 8 em 8 horas"
        case .H_12_12: return "De 12 em 12 horas"
        case .DIARIA: return "Diario"
        case .D_3_3: return "De 3 em 3 dias"
        case .D_5_5: return "De 5 em 5 dias"
        case .SEMANAL: return "Semanal"
        case .D_10_10: return "De 10 em 10 dias"
        case .D_15_15: return "De 15 em 15 dias"
        case .D_21_21: return "De 21 em 21 dias"
        case .MENSAL: return "Mensal"
        case .ETERNA_DIARIA: return "Diaria sem termino"
        case .ETERNA_SEMANAL: return "Semanal sem termino"
        case .ETERNA_QUINZENAL: return "Quinzenal sem termino"
        case .ETERNA_MENSAL: return "Mensal sem termino"
        case .ETERNA_TRIMESTRAL: return "Trimestral sem termino"
        case .ETERNA_SEMESTRAL: return "Semestral sem termino"
        case .ETERNA_ANUAL: return "Anual sem termino"
            
            
        }
    }

  
   
}
