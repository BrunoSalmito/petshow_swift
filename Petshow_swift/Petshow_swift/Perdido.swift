//
//  Perdido.swift
//  Petshow_swift
//
//  Created by Bruno Salmito on 05/09/17.
//  Copyright © 2017 Bruno Salmito. All rights reserved.
//

import Foundation


class Perdido:Entidade{
    
    var   usuario:Usuario?
    var   descAcontecimento:NSString?
    var   fotos:[NSString]?
    var   cidade:Cidade?
    var   estado:Estado?
    var   bairro:Bairro?
    var   dtPerdidoAchado:Date?
    var   telefoneCelular:NSNumber?
    var   dddCelular:NSNumber?
    var   telefoneResidencial:NSNumber?
    var   dddResidencial:NSNumber?
    var   dataCadastro:Date?
    var   raca:Racas?
    var   nome:NSString?
    var   flAcontecimento:NSString?
    var   tpAnimal:EnumTipoAnimal?
    var   tpCorPrincipal:EnumCor?
    var   tpCorSegundaria:EnumCor?
    var   dtResolvido:Date?
    var   flSexo:NSString?
    
    override func setValue(_ value: Any?, forKey key: String) {
        if key=="dtPerdidoAchado" {
            self.dtPerdidoAchado = DateUtil.formatResponseJson(dateString: value )
            
        }else if key=="dataCadastro"{
            self.dataCadastro = DateUtil.formatResponseJson(dateString: value )
            
        }else if key == "tpCorPrincipal" {
            self.tpCorPrincipal =  EnumUtil.getInListEnum(EnumCor.self, value)
            
        }else if key == "tpCorSegundaria" {
            self.tpCorSegundaria =  EnumUtil.getInListEnum(EnumCor.self, value)
            
        }else if key == "dtResolvido" {
            self.dtResolvido = DateUtil.formatResponseJson(dateString: value )
            
        }else if key == "tpAnimal" {
            self.tpAnimal = EnumUtil.getInListEnum(EnumTipoAnimal.self, value)
    
        }else{
            super.setValue(value, forKey: key)
            
        }
        
    }
    
    
    override func toJSON() -> Dictionary<String, AnyObject> {
        
        return[
            "id":(self.id  as AnyObject),
            "usuario":(self.usuario?.toJSON()  as AnyObject),
            "descAcontecimento":(self.descAcontecimento  as AnyObject),
            "fotos":(self.fotos  as AnyObject),
           "cidade":(self.cidade!.toJSON()  as AnyObject),
           "estado":(self.estado!.toJSON()  as AnyObject),
           "bairro":(self.bairro!.toJSON()  as AnyObject),
           "dtPerdidoAchado":(DateUtil.dateFormatToJson(date:self.dtPerdidoAchado)   as AnyObject),
           "telefoneCelular":(self.telefoneCelular  as AnyObject),
           "dddCelular":(self.dddCelular  as AnyObject),
           "telefoneResidencial":(self.telefoneResidencial  as AnyObject),
           "dddResidencial":(self.dddResidencial  as AnyObject),
           "dataCadastro":(DateUtil.dateFormatToJson(date:self.dataCadastro)   as AnyObject),
           "raca":(self.raca?.toJSON()  as AnyObject),
           "nome":(self.nome  as AnyObject),
           "flAcontecimento":(self.flAcontecimento  as AnyObject),
           "tpAnimal":self.tpAnimal!.rawValue as AnyObject,
           "tpCorPrincipal":self.tpCorPrincipal!.rawValue as AnyObject,
           "tpCorSegundaria":self.tpCorSegundaria!.rawValue as AnyObject,
           "dtResolvido":( DateUtil.dateFormatToJson(date:self.dtResolvido)  as AnyObject),
           "flSexo":(self.flSexo  as AnyObject)

        ]
        
        
    }
    
}
