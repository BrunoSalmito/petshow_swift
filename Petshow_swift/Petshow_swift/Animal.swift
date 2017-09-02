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
    var   dataNascimento:NSDate?
    var   flSexo:NSString?
    var   flAdocao:Bool?
    var   temReforco:Bool?
    var   frequenciaVermifugacao:EnumFrequenciaVermifugacao?
    

    override func setValue(_ value: Any?, forKey key: String) {
        if key=="flAdocao" || key=="temReforco" {
            
            if key=="flAdocao" {
                self.flAdocao = value as? Bool
            }
            
            if key=="temReforco"{
                self.temReforco=value as? Bool
            }
            
        }else if key=="tipo" || key=="frequenciaVermifugacao"{
            
            if key=="tipo"{
                for f in iterateEnum(EnumTipoAnimal) {
                    
                    if String(describing: f.self)==value as? String{
                        
                        tipo=f;
                    }
                }
            }else if key=="frequenciaVermifugacao" {
                for f in iterateEnum(EnumFrequenciaVermifugacao) {
                    
                    if String(describing: f.self)==value as? String{
                        
                        frequenciaVermifugacao=f;
                    }
                }
                
            }
        }else if key=="acessos"{
            
        }else{
            
            super.setValue(value, forKey: key)
        }
        
        
        
    }
    
    override func toJSON() -> Dictionary<String, AnyObject> {
        
        return[
            "fotoPerfil":(self.id  as AnyObject),
            "raca":(self.id  as AnyObject),
            "nome":(self.id  as AnyObject),
            "dataNascimento":(self.id  as AnyObject),
            "flSexo":(self.id  as AnyObject),
            "flAdocao":(self.id  as AnyObject),
            "temReforco":(self.id  as AnyObject),
            "frequenciaVermifugacao":self.frequenciaVermifugacao!.rawValue as AnyObject,
            "tipo":self.tipo!.rawValue as AnyObject
        ]
    }
    

    
    
}
