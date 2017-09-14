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
    static let count = 9
    static func getEnum(numero:Int)-> EnumTipoAnimal{
        if(numero == 0){
            return EnumTipoAnimal.CACHORRO
        }
        if(numero == 1){
            return EnumTipoAnimal.GATO
        }
        if(numero == 2){
            return EnumTipoAnimal.PASSARO
        }
        if(numero == 3){
            return EnumTipoAnimal.CAVALO
        }
        if(numero == 4){
            return EnumTipoAnimal.COBRA
        }
        if(numero == 5){
            return EnumTipoAnimal.PEIXE
        }
        if(numero == 6){
            return EnumTipoAnimal.LAGARTO
        }
        if(numero == 7){
            return EnumTipoAnimal.SUINO
        }
        if(numero == 8){
            return EnumTipoAnimal.OUTROS
        }
       return EnumTipoAnimal.OUTROS
       
    }
}
