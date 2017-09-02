
//
//  Usuario.swift
//  PetshowTeste
//
//  Created by Bruno Salmito on 14/06/17.
//  Copyright © 2017 Bruno Salmito. All rights reserved.
//

import Foundation

class Usuario:Entidade{
    
//    override init(){
//        
//    }
    
    var idFacebook:NSNumber?
    var flPreCadastro:Bool?
    var foto:NSString?
    var cidade:NSString?
    var estado:NSString?
    var pais:NSString?
    var rua:NSString?
    var bairro:NSString?
    var complemento:NSString?
    var nrEndereco:NSNumber?
    var nrCep:NSNumber?
    var cnpjCpf:NSString?
    var razaoSocial:NSString?
    var telefone:NSNumber?
    var ddd:NSNumber?
    var telefone2:NSNumber?
    var ddd2:NSNumber?
    var email:NSString?
    var password:NSString?
    var nome:NSString?
    var nmLogin:NSString?
    var urlfacebook:NSString?
    var validated:Bool?
    var dtCadastro:NSDate?
    var tipoUser:EnumTipoUser?
    var flTpEstabelecimento:EnumFlTpEstabelecimento?
    
    override func setValue(_ value: Any?, forKey key: String) {
        if key=="flPreCadastro" || key=="validated" {
            
            if key=="flPreCadastro" {
                self.flPreCadastro = value as? Bool
            }
            
            if key=="validated"{
                self.validated=value as? Bool
            }
            
        }else if key=="tipoUser" || key=="flTpEstabelecimento"{
            
            if key=="tipoUser"{
                for f in iterateEnum(EnumTipoUser) {
                    
                    if String(describing: f.self)==value as? String{
                        
                        tipoUser=f;
                    }
                }
            }else if key=="flTpEstabelecimento" {
                for f in iterateEnum(EnumFlTpEstabelecimento) {
                    
                    if String(describing: f.self)==value as? String{
                        
                        flTpEstabelecimento=f;
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
         "id":(self.id  as AnyObject),
         "idFacebook":(self.idFacebook  as AnyObject)          ,
         "flPreCadastro":self.flPreCadastro as AnyObject,
        "foto":self.foto as AnyObject,
         "cidade":self.cidade as AnyObject,
         "estado":self.estado as AnyObject,
         "pais":self.pais as AnyObject,
        "rua":self.rua as AnyObject,
         "bairro":self.bairro as AnyObject,
         "complemento":self.complemento as AnyObject,
         "nrEndereco":self.nrEndereco as AnyObject,
         "nrCep":self.nrCep as AnyObject,
         "cnpjCpf":self.cnpjCpf as AnyObject,
         "razaoSocial":self.razaoSocial as AnyObject,
         "telefone":self.telefone as AnyObject,
         "ddd":self.ddd as AnyObject,
         "telefone2":self.telefone2 as AnyObject,
         "ddd2":self.ddd2 as AnyObject,
         "email":self.email as AnyObject,
         "password":self.password as AnyObject,
         "nome":self.nome as AnyObject,
         "nmLogin":self.nmLogin as AnyObject,
         "urlfacebook":self.urlfacebook as AnyObject,
         "validated":self.validated as AnyObject,
         "dtCadastro":self.dtCadastro as AnyObject,
         //"tipoUser":(String(describing: self.tipoUser)  as AnyObject?)!,
         "flTpEstabelecimento": self.flTpEstabelecimento!.rawValue as AnyObject
        ]
    }
    
    


}
