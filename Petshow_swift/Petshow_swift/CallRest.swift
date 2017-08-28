//
//  CallRest.swift
//  PetshowTeste
//
//  Created by Bruno Salmito on 23/06/17.
//  Copyright © 2017 Bruno Salmito. All rights reserved.
//

import Foundation

class CallRest{
    
    static func requestPostEntity(url:String,entidade:Entidade,callBack: @escaping (_ json:[String: AnyObject])-> Void,callBackError: @escaping (_ mapError:MapErrorRetornoRest)-> Void) {
        
        let parameters = entidade.toJSON()
        
        guard let url = URL(string: UtilParameters.UrlAcessoRest+url) else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        guard let httpBody = try? JSONSerialization.data(withJSONObject: parameters, options:[]) else { return }
        request.httpBody=httpBody
        
        
        let session = URLSession.shared
        session.dataTask(with: request) { (data, response, error) in
            
            
            if response != nil {
                //print(response)
                //callBack.responseWithReturn()
                
            }
            
            if let data = data {
                do {
                    
                    
                    
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    print(json)
                    
                    
                    let erroMap = CallRest.isMapError(json: json)
                    
                    
                    if  erroMap != nil{
                        callBackError(erroMap!)
                    }else{
                        let entidadeRetorno = Usuario()//retirar
                        entidadeRetorno.setValuesForKeys(json as! [String: AnyObject])//retirar
                        callBack(json as! [String: AnyObject])
                    }
                    
                } catch {
                    print(error)
                }
            }
            
            }.resume()
        
        
        
    }
    
    //static func requestGetEntity(url:String) {

    static func requestGetEntity(url:String,callBack: @escaping (_ json:[String: AnyObject])-> Void,callBackError: @escaping (_ mapError:MapErrorRetornoRest)-> Void) {
        
        guard let url = URL(string: UtilParameters.UrlAcessoRest+url) else { return }
        
        let session = URLSession.shared
        session.dataTask(with: url) { (data, response, error) in
////            if let response = response {
////                print(response)
////            }
////            
////            if let data = data {
////                print(data)
////                do {
////                    let json = try JSONSerialization.jsonObject(with: data, options:  .mutableContainers)
////                    print(json)
////                    let appDetail = Usuario()
////                    appDetail.setValuesForKeys(json as! [String: AnyObject])
////                    
////                } catch {
////                    print(error)
////                }
////                
////            }
//            
            if response != nil {
                //print(response)
                //callBack.responseWithReturn()
                
            }
            
            if let data = data {
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    print(json)
                    
                    
                    let erroMap = CallRest.isMapError(json: json)
                    
                    
                    if  erroMap != nil{
                        callBackError(erroMap!)
                    }else{
                        let entidadeRetorno = Usuario()//retirar
                        entidadeRetorno.setValuesForKeys(json as! [String: AnyObject])//retirar
                        callBack(json as! [String: AnyObject])
                    }
                    
                } catch {
                    print(error)
                }
            }

            }.resume()
    }
    
    static func isMapError(json:Any) ->MapErrorRetornoRest?{
        
        
        let jsondata = json as! [String: Any]
        let rootCause = jsondata["rootCause"]
        var erroMap:MapErrorRetornoRest!
        if  rootCause != nil{
            erroMap = MapErrorRetornoRest()
            erroMap.setValuesForKeys(json as! [String: AnyObject])
            
        }
        return erroMap
        
    }



}
