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
                   // print(json)
                    
                    
                    let erroMap = CallRest.isMapError(json: json)
                    
                    
                    if  erroMap != nil{
                        callBackError(erroMap!)
                    }else{
                       
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
     
            if response != nil {
                //print(response)
                //callBack.responseWithReturn()
                
            }
            
            if let data = data {
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                   // print(json)
                    
                    
                    let erroMap = CallRest.isMapError(json: json)
                    
                    
                    if  erroMap != nil{
                        callBackError(erroMap!)
                    }else{
                       
                        callBack(json as! [String: AnyObject])
                    }
                    
                } catch {
                    print(error)
                }
            }

            }.resume()
    }
    
    
    
    static func requestGetList(url:String,callBack: @escaping (_ json:[[String:AnyObject]])-> Void,callBackError: @escaping (_ mapError:MapErrorRetornoRest)-> Void) {
        
        guard let url = URL(string: UtilParameters.UrlAcessoRest+url) else { return }
        
        let session = URLSession.shared
        session.dataTask(with: url) { (data, response, error) in
            
            if response != nil {
                //print(response)
                //callBack.responseWithReturn()
                
            }
            
            if let data = data {
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                   // print(json)
                    
                    let erroMap = CallRest.isMapError(json: json)
                    
                    if  erroMap != nil{
                        callBackError(erroMap!)
                    }else{
                        let list = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers) as? [[String:AnyObject]]

                        callBack(list!)
                        
                    }
                    
                } catch {
                    print(error)
                }
            }
            
            }.resume()
    }

    static func requestDeleteEntity(url:String,entidade:Entidade,callBack: @escaping (_ json:[String: AnyObject])-> Void,callBackError: @escaping (_ mapError:MapErrorRetornoRest)-> Void) {
        
        let parameters = entidade.toJSON()
        
        guard let url = URL(string: UtilParameters.UrlAcessoRest+url) else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "DELETE"
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
                   // print(json)
                    
                    
                    let erroMap = CallRest.isMapError(json: json)
                    
                    
                    if  erroMap != nil{
                        callBackError(erroMap!)
                    }else{
                        
                        callBack(json as! [String: AnyObject])
                    }
                    
                } catch {
                    print(error)
                }
            }
            
            }.resume()
        
        
        
    }
    static func requestDeleteEntity(url:String,callBack: @escaping (_ json:[String: AnyObject])-> Void,callBackError: @escaping (_ mapError:MapErrorRetornoRest)-> Void) {
        
        guard let url = URL(string: UtilParameters.UrlAcessoRest+url) else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "DELETE"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        let session = URLSession.shared
        session.dataTask(with: request) { (data, response, error) in
            
            if response != nil {
                //print(response)
                //callBack.responseWithReturn()
                
            }
            if data?.count == 0 {
                callBack([String: AnyObject]())
            }
            if let data = data {
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                   // print(json)
                    
                    
                    let erroMap = CallRest.isMapError(json: json)
                    
                    
                    if  erroMap != nil{
                        callBackError(erroMap!)
                    }else{
                        
                        callBack(json as! [String: AnyObject])
                    }
                    
                } catch {
                    print(error)
                }
            }
            
            }.resume()
    }


    
    
    
    
    static func isMapError(json:Any) ->MapErrorRetornoRest?{
        
        
        var erroMap:MapErrorRetornoRest!
        let jsondata = json as? [String: Any]
        if jsondata != nil {
            
            let rootCause = jsondata?["rootCause"]
            
            if  rootCause != nil{
                erroMap = MapErrorRetornoRest()
                erroMap.setValuesForKeys(json as! [String: AnyObject])
                
            }
        }
        return erroMap
        
    }



}
