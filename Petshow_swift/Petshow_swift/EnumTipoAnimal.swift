//
//  EnumTipoAnimal.swift
//  Petshow_swift
//
//  Created by Bruno Salmito on 29/08/17.
//  Copyright © 2017 Bruno Salmito. All rights reserved.
//

import Foundation

enum EnumTipoAnimal:String{
    case CACHORRO,GATO,PASSARO,CAVALO,COBRA,PEIXE,LAGARTO,SUINO,OUTROS
    static let count:Int = {
        return EnumUtil.enumCount(EnumFrequenciaTratamento)
    }()
//    static func getEnum(numero:Int)-> EnumTipoAnimal{
//        if(numero == 0){
//            return EnumTipoAnimal.CACHORRO
//        }
//        if(numero == 1){
//            return EnumTipoAnimal.GATO
//        }
//        if(numero == 2){
//            return EnumTipoAnimal.PASSARO
//        }
//        if(numero == 3){
//            return EnumTipoAnimal.CAVALO
//        }
//        if(numero == 4){
//            return EnumTipoAnimal.COBRA
//        }
//        if(numero == 5){
//            return EnumTipoAnimal.PEIXE
//        }
//        if(numero == 6){
//            return EnumTipoAnimal.LAGARTO
//        }
//        if(numero == 7){
//            return EnumTipoAnimal.SUINO
//        }
//        if(numero == 8){
//            return EnumTipoAnimal.OUTROS
//        }
//       return EnumTipoAnimal.OUTROS
//       
//    }
    
    static func getEnum(orderId:Int)-> EnumTipoAnimal?{
        for enumAux in EnumUtil.iterateEnum(EnumTipoAnimal) {
            
            if enumAux.orderId == orderId {
                
                return enumAux
            }
        }
        return nil
    }
    
     func getEnum(id:Int)-> EnumTipoAnimal?{
        for enumAux in EnumUtil.iterateEnum(EnumTipoAnimal) {
            
            if enumAux.id == id {
                
                return enumAux
            }
        }
        var imageDefaultNoPhoto:String = "iVBORw0KGgoAAAANSUhEUgAAASwAAAEsCAAAAABcFtGpAAAM3mlDQ1BJQ0MgUHJv"
        imageDefaultNoPhoto.append("iVBORw0KGgoAAAANSUhEUgAAASwAAAEsCAAAAABcFtGpAAAM3mlDQ1BJQ0MgUHJv")
        return nil
    }
    
    var orderId: Int {
        switch self {
        case .CACHORRO: return 0
        case .GATO: return 1
        case .PASSARO: return 2
        case .CAVALO: return 3
        case .COBRA: return 4
        case .PEIXE: return 5
        case .LAGARTO: return 6
        case .SUINO: return 7
        case .OUTROS: return 8
        }
    }
    var id: Int {
        switch self {
        case .CACHORRO: return 0
        case .GATO: return 1
        case .PASSARO: return 2
        case .CAVALO: return 3
        case .COBRA: return 4
        case .PEIXE: return 5
        case .LAGARTO: return 6
        case .SUINO: return 7
        case .OUTROS: return 8
        }
    }

}
