//
//  Adocao.swift
//  Petshow_swift
//
//  Created by Bruno Salmito on 04/09/17.
//  Copyright © 2017 Bruno Salmito. All rights reserved.
//

import Foundation

class Adocao:Entidade{
    
    var   dataAdocao:NSDate?
    var   usuario:Usuario?
    var   descAdocao:NSString?
    // variavel lista de fotos
    var   fotos:[NSString]?
    var   fase:EnumFaseVida?
    var   flVacinado:Bool?
    var   flVermifugado:Bool?
    var   castrado:Bool?
    var   cidade:Cidade?
    var   estado:Estado?
    var   bairro:Bairro?
    var   telefoneCelular:NSInteger?
    var   dddCelular:NSInteger?
    var   telefoneResidencial:NSInteger?
    var   dddResidencial:NSInteger?
    var   dataCadastro:NSDate?
    var   tipo:EnumTipoAnimal?
    var   raca:NSString?
    var   flSexo:NSString?
    var   porteAnimal:EnumPorteAnimal?
    
    override func setValue(_ value: Any?, forKey key: String) {
        if key=="flVacinado" || key=="flVermifugado" || key=="castrado"{
            
            if key=="flVacinado" {
                self.flVacinado = value as? Bool
            }
            
            if key=="flVermifugado"{
                self.flVermifugado=value as? Bool
            }
            
            if key=="castrado"{
                self.castrado=value as? Bool
            }
            
        }else if key=="fase" || key=="porteAnimal" || key=="tipo"{
            
            if key=="tipo"{
                for f in iterateEnum(EnumTipoAnimal) {
                    
                    if String(describing: f.self)==value as? String{
                        
                        tipo=f;
                    }
                }
            }else if key=="porteAnimal" {
                for f in iterateEnum(EnumPorteAnimal) {
                    
                    if String(describing: f.self)==value as? String{
                        
                        porteAnimal=f;
                    }
                }
                
            }else if key=="fase" {
                for f in iterateEnum(EnumFaseVida) {
                    
                    if String(describing: f.self)==value as? String{
                        
                        fase=f;
                    }
                }
                
            }

        }else{
            
            super.setValue(value, forKey: key)
        }
        
        
        
    }
    
    override func toJSON() -> Dictionary<String, AnyObject> {
        
        return[
           "id":(self.id  as AnyObject),
           "dataAdocao":(self.dataAdocao  as AnyObject),
           "usuario":(self.usuario  as AnyObject),
           "descAdocao":(self.descAdocao  as AnyObject),
           "fotos":(self.fotos  as AnyObject),
           "fase":self.fase!.rawValue as AnyObject,
           "flVacinado":(self.flVacinado  as AnyObject),
           "flVermifugado":(self.flVermifugado  as AnyObject),
           "castrado:":(self.castrado  as AnyObject),
           "cidade:":(self.cidade  as AnyObject),
           "estado":(self.estado  as AnyObject),
           "bairro":(self.bairro  as AnyObject),
           "telefoneCelular":(self.telefoneCelular  as AnyObject),
           "dddCelular:":(self.dddCelular  as AnyObject),
           "telefoneResidencial":(self.telefoneResidencial  as AnyObject),
           "dddResidencial":(self.dddResidencial  as AnyObject),
           "dataCadastro":(self.dataCadastro  as AnyObject),
           "tipo:":self.tipo!.rawValue as AnyObject,
           "raca":(self.raca  as AnyObject),
           "flSexo":(self.flSexo  as AnyObject),
           "porteAnimal":self.porteAnimal!.rawValue as AnyObject

        ]
    }


 
}
