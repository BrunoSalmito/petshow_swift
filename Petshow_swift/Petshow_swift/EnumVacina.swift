//
//  EnumVacina.swift
//  Petshow_swift
//
//  Created by Bruno Salmito on 14/09/17.
//  Copyright © 2017 Bruno Salmito. All rights reserved.
//
import Foundation
enum EnumVacina:String{
    case CPOLIVALENTE,CPOLIVALENTE_R1,CPOLIVALENTE_R2,CPOLIVALENTE_ANUAL,CANTIRRABICA,CANTIRRABICA_ANUAL,CGRIPE_CANINA,CGRIPE_CANINA_R1,CGRIPE_CANINA_ANUAL,CGIARDIASE,CGIARDIASE_R1,CGIARDIASE_ANUAL, CLEISHMANIOSE,CLEISHMANIOSE_R1,CLEISHMANIOSE_R2,CLEISHMANIOSE_ANUAL
    
    static let count:Int = {
        return EnumUtil.enumCount(EnumVacina.self)
    }()
    
    
    static func getEnum(orderId:Int)-> EnumVacina?{
        for enumAux in EnumUtil.iterateEnum(EnumVacina.self) {
            
            if enumAux.orderId == orderId {
                
                return enumAux
            }
        }
        return nil
    }
    static func getEnum(id:Int)-> EnumVacina?{
        for enumAux in EnumUtil.iterateEnum(EnumVacina.self) {
            
            if enumAux.id == id {
                
                return enumAux
            }
        }
        return nil
    }
    
    
    
    static func getEnumyTypeAnimal(orderId:Int,enumTipoAnimal:EnumTipoAnimal)-> EnumVacina?{
        var list:[EnumVacina] = getListEnumByTypeAnimal(enumTipoAnimal:enumTipoAnimal)!
        
        
        return list[orderId]
    }
    
    static func getListEnumByTypeAnimal(enumTipoAnimal:EnumTipoAnimal)-> [EnumVacina]?{
        var returnAux:[EnumVacina] = []
        
        for f in EnumUtil.iterateEnum(EnumVacina.self) {
            
            if enumTipoAnimal == f.tp{
                
                returnAux.append(f)
            }
        }
        return returnAux
    }
    
    var id: Int {
        switch self {
            
        case .CPOLIVALENTE: return 1
        case .CPOLIVALENTE_R1: return 2
        case .CPOLIVALENTE_R2: return 3
        case .CPOLIVALENTE_ANUAL: return 4
        case .CANTIRRABICA: return 5
        case .CANTIRRABICA_ANUAL: return 6
        case .CGRIPE_CANINA: return 7
        case .CGRIPE_CANINA_R1: return 8
        case .CGRIPE_CANINA_ANUAL: return 9
        case .CGIARDIASE: return 10
        case .CGIARDIASE_R1: return 11
        case .CGIARDIASE_ANUAL: return 12
        case .CLEISHMANIOSE: return 13
        case .CLEISHMANIOSE_R1: return 14
        case .CLEISHMANIOSE_R2: return 15
        case .CLEISHMANIOSE_ANUAL: return 16
       
            
            
        }
    }
    
    var orderId: Int {
        switch self {
            
        case .CPOLIVALENTE: return 0
        case .CPOLIVALENTE_R1: return 1
        case .CPOLIVALENTE_R2: return 2
        case .CPOLIVALENTE_ANUAL: return 3
        case .CANTIRRABICA: return 4
        case .CANTIRRABICA_ANUAL: return 5
        case .CGRIPE_CANINA: return 6
        case .CGRIPE_CANINA_R1: return 7
        case .CGRIPE_CANINA_ANUAL: return 8
        case .CGIARDIASE: return 9
        case .CGIARDIASE_R1: return 10
        case .CGIARDIASE_ANUAL: return 11
        case .CLEISHMANIOSE: return 12
        case .CLEISHMANIOSE_R1: return 13
        case .CLEISHMANIOSE_R2: return 14
        case .CLEISHMANIOSE_ANUAL: return 15
  
        }
    }

    var nome: String {
        switch self {
            
        case .CPOLIVALENTE: return "Polivalente V8/V10 1º DOSE"
        case .CPOLIVALENTE_R1: return "Polivalente V8/V10 2º DOSE"
        case .CPOLIVALENTE_R2: return "Polivalente V8/V10 3º DOSE"
        case .CPOLIVALENTE_ANUAL: return "Polivalente Anual"
        case .CANTIRRABICA: return "Antirrábica  1º DOSE"
        case .CANTIRRABICA_ANUAL: return "Antirrábica Anual"
        case .CGRIPE_CANINA: return "GRIPE  1º DOSE"
        case .CGRIPE_CANINA_R1: return "GRIPE  2º DOSE"
        case .CGRIPE_CANINA_ANUAL: return "GRIPE ANUAL"
        case .CGIARDIASE: return "GIARDIA  1º DOSE"
        case .CGIARDIASE_R1: return "GIARDIA 2º DOSE"
        case .CGIARDIASE_ANUAL: return "GIARDIA ANUAL"
        case .CLEISHMANIOSE: return "CALAZAR 1º DOSE"
        case .CLEISHMANIOSE_R1: return "CALAZAR 2º DOSE"
        case .CLEISHMANIOSE_R2: return "CALAZAR 3º DOSE"
        case .CLEISHMANIOSE_ANUAL: return "CALAZAR ANUAL"
            
        }
    }

    var tp: EnumTipoAnimal {
        switch self {
            
        case .CPOLIVALENTE: return EnumTipoAnimal.CACHORRO
        case .CPOLIVALENTE_R1: return EnumTipoAnimal.CACHORRO
        case .CPOLIVALENTE_R2: return EnumTipoAnimal.CACHORRO
        case .CPOLIVALENTE_ANUAL: return EnumTipoAnimal.CACHORRO
        case .CANTIRRABICA: return EnumTipoAnimal.CACHORRO
        case .CANTIRRABICA_ANUAL: return EnumTipoAnimal.CACHORRO
        case .CGRIPE_CANINA: return EnumTipoAnimal.CACHORRO
        case .CGRIPE_CANINA_R1: return EnumTipoAnimal.CACHORRO
        case .CGRIPE_CANINA_ANUAL: return EnumTipoAnimal.CACHORRO
        case .CGIARDIASE: return EnumTipoAnimal.CACHORRO
        case .CGIARDIASE_R1: return EnumTipoAnimal.CACHORRO
        case .CGIARDIASE_ANUAL: return EnumTipoAnimal.CACHORRO
        case .CLEISHMANIOSE: return EnumTipoAnimal.CACHORRO
        case .CLEISHMANIOSE_R1: return EnumTipoAnimal.CACHORRO
        case .CLEISHMANIOSE_R2: return EnumTipoAnimal.CACHORRO
        case .CLEISHMANIOSE_ANUAL: return EnumTipoAnimal.CACHORRO
            
        }
    }
    
    var idProxima: Int {
        switch self {
            
        case .CPOLIVALENTE: return 2
        case .CPOLIVALENTE_R1: return 3
        case .CPOLIVALENTE_R2: return 4
        case .CPOLIVALENTE_ANUAL: return 4
        case .CANTIRRABICA: return 6
        case .CANTIRRABICA_ANUAL: return 6
        case .CGRIPE_CANINA: return 8
        case .CGRIPE_CANINA_R1: return 9
        case .CGRIPE_CANINA_ANUAL: return 9
        case .CGIARDIASE: return 11
        case .CGIARDIASE_R1: return 12
        case .CGIARDIASE_ANUAL: return 12
        case .CLEISHMANIOSE: return 14
        case .CLEISHMANIOSE_R1: return 15
        case .CLEISHMANIOSE_R2: return 16
        case .CLEISHMANIOSE_ANUAL: return 16
            
        }
    }

    
}


