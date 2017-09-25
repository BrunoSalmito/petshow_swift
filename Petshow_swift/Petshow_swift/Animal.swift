//
//  Animal.swift
//  Petshow_swift
//
//  Created by Bruno Salmito on 29/08/17.
//  Copyright © 2017 Bruno Salmito. All rights reserved.
//

import Foundation

class Animal:Entidade{

    var   fotoPerfil:NSString?
    var   tipo:EnumTipoAnimal?
    var   raca:NSString?
    var   nome:NSString?
    var   dataNascimento:Date?
    var   flSexo:NSString?
    var   flAdocao:Bool?
    var   temReforco:Bool?
    var   frequenciaVermifugacao:EnumFrequenciaVermifugacao?
    

    override func setValue(_ value: Any?, forKey key: String) {
        
            
            if key == "flAdocao" {
                self.flAdocao = value as? Bool
            }
            else  if key == "temReforco"{
                
                self.temReforco=value as? Bool
                
            }else if key == "tipo"{
                
                self.tipo = EnumUtil.getInListEnum(EnumTipoAnimal.self, value)
                
            }else if key == "frequenciaVermifugacao" {
                
                self.frequenciaVermifugacao = EnumUtil.getInListEnum(EnumFrequenciaVermifugacao.self, value)
                
            }else if key == "dataNascimento" {
                
                self.dataNascimento = DateUtil.formatResponseJson(dateString: value )
                
            }else if key=="acessos"{
                
            }else{
                 super.setValue(value, forKey: key)
            }
        
        
        
    }
    
    override func toJSON() -> Dictionary<String, AnyObject> {
        
        
        
        return[
             "id":(self.id  as AnyObject),
            "fotoPerfil":(self.fotoPerfil  as AnyObject),
            "raca":(self.raca  as AnyObject),
            "nome":(self.nome  as AnyObject),
            "dataNascimento":(DateUtil.dateFormatToJson(date:self.dataNascimento!) as AnyObject),
            "flSexo":(self.flSexo  as AnyObject),
            "flAdocao":(self.flAdocao  as AnyObject),
            "temReforco":(self.temReforco  as AnyObject),
            "frequenciaVermifugacao": frequenciaVermifugacao?.rawValue  as AnyObject,
            "tipo":self.tipo!.rawValue as AnyObject
        ]
    }
    

    
    
}
