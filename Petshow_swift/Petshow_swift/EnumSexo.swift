//
//  EnumSexo.swift
//  Petshow_swift
//
//  Created by Bruno Salmito on 28/09/17.
//  Copyright © 2017 Bruno Salmito. All rights reserved.
//

import Foundation

enum EnumSexo:String{
    case MACHO,FEMEA
    
    static let count:Int = {
        return EnumUtil.enumCount(EnumSexo.self)
    }()
    
     static func getDescEnum(caractere:String)-> String?{
        
        if(caractere == "M" || caractere == "m"){
            return "Macho"
        }
        if(caractere == "F" || caractere == "f"){
            return "Fêmea"
        }
        
        return nil
    }
    static func getEnum(orderId:Int)-> EnumSexo?{
        
        for enumAux in EnumUtil.iterateEnum(EnumSexo.self) {
            
            if enumAux.orderId == orderId {
                
                return enumAux
            }
        }
        
        return nil
    }
    static func getEnum(id:Int)-> EnumSexo? {
        
        for enumAux in EnumUtil.iterateEnum(EnumSexo.self) {
            
            if enumAux.id == id {
                
                return enumAux
            }
        }
        return nil
    }
    
    var id: Int {
        switch self {
            
        case .MACHO: return 1
        case .FEMEA: return 2
        }
    }
    
    var orderId: Int {
        switch self {
            
        case .MACHO: return 0
        case .FEMEA: return 1
           
            
            
        }
    }
    
    var desc: String {
        switch self {
            
        case .MACHO: return "M"
        case .FEMEA: return "F"
            
        }
    }
    
   
    
    
}
