//
//  EnumVacina.swift
//  Petshow_swift
//
//  Created by Bruno Salmito on 14/09/17.
//  Copyright © 2017 Bruno Salmito. All rights reserved.
//
import Foundation
enum EnumVacina:String{
    case CPOLIVALENTE,CPOLIVALENTE_R1,CPOLIVALENTE_R2,CPOLIVALENTE_ANUAL,CANTIRRABICA,CANTIRRABICA_ANUAL,CGRIPECANINA,CGRIPECANINA_R1,CGRIPECANINA_ANUAL,CGIARDIASE,CGIARDIASE_R1,CGIARDIASE_ANUAL, CLEISHMANIOSE,CLEISHMANIOSE_R1,CLEISHMANIOSE_R2,CLEISHMANIOSE_ANUAL
    
    
    let dados:ModelVacina = [ModelVacina()]
    
    
    
    
}



class ModelVacina{
    
    var id:Int
    var nome:String
    var tp:EnumTipoAnimal
    var idProxima:Int
    
    init( id:Int, nome:String, tp:EnumTipoAnimal, idProxima:Int) {
        self.id=id
        self.nome=nome
        self.tp=tp
        self.idProxima=idProxima
    }
}
