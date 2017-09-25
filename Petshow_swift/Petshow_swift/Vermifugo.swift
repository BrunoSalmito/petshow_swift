//
//  Vermifugo.swift
//  Petshow_swift
//
//  Created by Bruno Salmito on 14/09/17.
//  Copyright © 2017 Bruno Salmito. All rights reserved.
//

import Foundation

class Vermifugo:Entidade{
    
    var   animal:Animal?
    var   dtVermifugoDose1:NSDate?
    var   reforco:Bool?
    var   dtVermifugoDoseReforco:NSDate?
    var   dtVermifugoDose1Ant:NSDate?
    var   dtVermifugoDoseReforcoAnt:NSDate?
    var   frequencia:EnumFrequenciaVermifugacao?
    var   isTomou1:Bool?
    var   isTomouReforco:Bool?
   
    
    
    override func setValue(_ value: Any?, forKey key: String) {
        if key=="reforco" || key=="tomou1" || key=="tomouReforco"{
            
            if(key=="reforco"){
                self.reforco = value as? Bool
            }
            if(key=="tomou1"){
                self.isTomou1 = value as? Bool
            }
            if(key=="tomouReforco"){
                self.isTomouReforco = value as? Bool
            }
            
            
        }else if key=="frequencia"{
            for f in EnumUtil.iterateEnum(EnumFrequenciaVermifugacao) {
                
                if String(describing: f.self)==value as? String{
                    
                    frequencia=f;
                }
            }
        }else{
            
            super.setValue(value, forKey: key)
        }
        
        
        
    }
    
    override func toJSON() -> Dictionary<String, AnyObject> {
        
        var ttt = (self.dtVermifugoDose1!.description  as AnyObject)
        var ttt2 = (self.dtVermifugoDose1Ant!.description  as AnyObject)
        print(ttt)
        print(ttt2)
        print(Date().jsonDate)
        print(NSDate().jsonDate)
        return[
            "id":(self.id  as AnyObject),
            "animal":(self.animal  as AnyObject),
            "frequencia":self.frequencia!.rawValue as AnyObject,
            "dtVermifugoDose1":"2021-03-01" as AnyObject//
            //"dtVermifugoDose1":self.dtVermifugoDose1!.jsonDate as AnyObject//,
            //"dtVermifugoDoseReforco":(self.dtVermifugoDoseReforco!.jsonDate  as AnyObject),
            //"dtVermifugoDose1Ant":(self.dtVermifugoDose1Ant!.jsonDate  as AnyObject),
            //"dtVermifugoDoseReforcoAnt":(self.dtVermifugoDoseReforcoAnt!.jsonDate  as AnyObject),
            //"isTomou1":(self.isTomou1  as AnyObject),
            //"reforco":(self.reforco  as AnyObject),
            //"isTomouReforco":(self.isTomouReforco  as AnyObject)
        
            
        ]
    }
    
  
    
}
extension Date {
    var jsonDate: String {
        let ticks = lround(timeIntervalSince1970 * 1000)
        return "/Date(\(ticks))/"
    }
}
extension NSDate {
    var jsonDate: String {
        let ticks = lround(timeIntervalSince1970 * 1000)
        return "/Date(\(ticks))/"
    }
}
