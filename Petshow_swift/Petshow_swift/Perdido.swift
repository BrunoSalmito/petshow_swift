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
    var   dataPerdido:NSDate?
    var   telefoneCelular:NSInteger?
    var   dddCelular:NSInteger?
    var   telefoneResidencial:NSInteger?
    var   dddResidencial:NSInteger?
    var   dataCadastro:NSDate?
    var   raca:Racas?
    var   nome:NSString?
    var   flAcontecimento:NSString?
    var   tpAnimal:EnumTipoAnimal?
    var   tpCorPrincipal:EnumCor?
    var   tpCorSegundaria:EnumCor?
    var   dtResolvido:NSDate?
    var   flSexo:NSString?
    
    
    
    override func toJSON() -> Dictionary<String, AnyObject> {
        
        return[
            "id":(self.id  as AnyObject),
            "usuario":(self.id  as AnyObject),
            "descAcontecimento":(self.id  as AnyObject),
            "fotos":(self.id  as AnyObject),
           "cidade":(self.id  as AnyObject),
           "estado":(self.id  as AnyObject),
           "bairro":(self.id  as AnyObject),
           "dataPerdido":(self.id  as AnyObject),
           "telefoneCelular":(self.id  as AnyObject),
           "dddCelular":(self.id  as AnyObject),
           "telefoneResidencial":(self.id  as AnyObject),
           "dddResidencial":(self.id  as AnyObject),
           "dataCadastro":(self.id  as AnyObject),
           "raca":(self.id  as AnyObject),
           "nome":(self.id  as AnyObject),
           "flAcontecimento":(self.id  as AnyObject),
           "tpAnimal":self.tpAnimal!.rawValue as AnyObject,
           "tpCorPrincipal":self.tpCorPrincipal!.rawValue as AnyObject,
           "tpCorSegundaria":self.tpCorSegundaria!.rawValue as AnyObject,
           "dtResolvido":(self.id  as AnyObject),
           "flSexo":(self.id  as AnyObject)

        ]
        
        
    }
    
}
