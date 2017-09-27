//
//  Adocao.swift
//  Petshow_swift
//
//  Created by Bruno Salmito on 04/09/17.
//  Copyright © 2017 Bruno Salmito. All rights reserved.
//

import Foundation

class Adocao:Entidade{
    
    var   dataAdocao:Date?
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
    var   telefoneCelular:NSNumber?
    var   dddCelular:NSNumber?
    var   telefoneResidencial:NSNumber?
    var   dddResidencial:NSNumber?
    var   dataCadastro:Date?
    var   tipo:EnumTipoAnimal?
    var   raca:NSString?
    var   flSexo:NSString?
    var   porteAnimal:EnumPorteAnimal?
    
    override func setValue(_ value: Any?, forKey key: String) {
        
        if key=="flVacinado" {
            self.flVacinado = value as? Bool
            
        }else if key=="flVermifugado"{
            self.flVermifugado=value as? Bool
            
        }else if key=="castrado"{
            self.castrado=value as? Bool
            
        }else if key=="tipo"{
            self.tipo = EnumUtil.getInListEnum(EnumTipoAnimal.self, value)
            
        }else if key=="porteAnimal" {
            self.porteAnimal = EnumUtil.getInListEnum(EnumPorteAnimal.self, value)
            
        }else if key=="fase" {
            self.fase = EnumUtil.getInListEnum(EnumFaseVida.self, value)
            
        }else if key=="dataCadastro" {
            self.dataCadastro = DateUtil.formatResponseJson(dateString: value )
            
        }else if key=="dataAdocao" {
            self.dataAdocao = DateUtil.formatResponseJson(dateString: value )
            
        }else{
            super.setValue(value, forKey: key)
            
        }
        
        
        
    }
    
    override func toJSON() -> Dictionary<String, AnyObject> {
        
        return[
           "id":(self.id  as AnyObject),
           "dataAdocao": DateUtil.dateFormatToJson(date:self.dataAdocao)! ,
           "usuario":(self.usuario!.toJSON()  as AnyObject),
           "descAdocao":(self.descAdocao  as AnyObject),
           "fotos":(self.fotos  as AnyObject),
           "fase":self.fase!.rawValue as AnyObject,
           "flVacinado":(self.flVacinado  as AnyObject),
           "flVermifugado":(self.flVermifugado  as AnyObject),
           "castrado:":(self.castrado  as AnyObject),
           "cidade:":(self.cidade?.toJSON()  as AnyObject),
           "estado":(self.estado?.toJSON()  as AnyObject),
           "bairro":(self.bairro?.toJSON()  as AnyObject),
           "telefoneCelular":(self.telefoneCelular  as AnyObject),
           "dddCelular:":(self.dddCelular  as AnyObject),
           "telefoneResidencial":(self.telefoneResidencial  as AnyObject),
           "dddResidencial":(self.dddResidencial  as AnyObject),
           "dataCadastro":DateUtil.dateFormatToJson(date:self.dataCadastro)!,
           "tipo:":self.tipo!.rawValue as AnyObject,
           "raca":(self.raca  as AnyObject),
           "flSexo":(self.flSexo  as AnyObject),
           "porteAnimal":self.porteAnimal!.rawValue as AnyObject

        ]
    }


 
}
