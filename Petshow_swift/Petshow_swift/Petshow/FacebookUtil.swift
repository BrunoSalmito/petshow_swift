//
//  FacebookUtil.swift
//  Petshow
//
//  Created by Bruno Salmito on 30/06/17.
//  Copyright © 2017 Bruno Salmito. All rights reserved.
//

import Foundation
import FacebookCore
import FacebookLogin
import FBSDKCoreKit
import FBSDKLoginKit
import FBSDKShareKit

class FacebookUtil{
    
    static var usuarioLogado:Usuario?
    
    var viewController: UIViewController
    
    init(viewController: UIViewController){
        self.viewController=viewController
    }
    
    func loadProfileFacebook(){
        
        
        FBSDKGraphRequest(graphPath: "me", parameters: ["fields": "id, name, first_name,last_name, picture.type(large),email,updated_time"]).start(completionHandler: { (connection, result, error) -> Void in
            if (error == nil){
                
                if let userDict = result as? NSDictionary {
                   let id = userDict["id"] as! String
                    
                   CallRest.requestGetEntity(url: "usuario/facebook/"+id, callBack: self.callBackOKloadProfileFacebook, callBackError: self.callBackErrorloadProfileFacebook)
                    
                }
            }
        })

        
        
        
        
        
        
        
    }
    func callBackOKloadProfileFacebook(json:[String: AnyObject]){
      
            FBSDKGraphRequest(graphPath: "me", parameters: ["fields": "id, name, first_name,last_name, picture.type(large),email,updated_time"]).start(completionHandler: { (connection, result, error) -> Void in
                if (error == nil){
                    
                    if let userDict = result as? NSDictionary {
                        let first_Name = userDict["first_name"] as! String
                        let last_Name = userDict["last_name"] as! String
                        let id = userDict["id"] as! String
                        let email = userDict["email"] as! String
                        if json != nil{
                            let entidadeRetorno = Usuario()
                            entidadeRetorno.setValuesForKeys(json)
                            
                            self.salvarUsuario(usuario: entidadeRetorno, nome: (first_Name + " " + last_Name ), email: email, idFacebook: nil, urlPhoto: nil)
                        }else{
                            self.salvarUsuario(usuario:nil, nome:(first_Name + " " + last_Name ), email:email, idFacebook:id, urlPhoto:nil)
                        }
                    }
                }
            })
        
    }
    func callBackErrorloadProfileFacebook(mapErro:MapErrorRetornoRest){
       print("erro chamada")
        print("erro chamada")
        
    }
    

    
    func salvarUsuario(usuario:Usuario!, nome:String!,email:String!,idFacebook:String!,urlPhoto:String!) -> Void{
        
        if usuario == nil {
            let usuario = Usuario()
            usuario.nome = nome as NSString
            var auxIdFacebook = Int(idFacebook)
            
            usuario.idFacebook=NSNumber(value:auxIdFacebook!)
            usuario.email = email as NSString
            usuario.flPreCadastro = false
            usuario.password = "semPassword4848648"
            usuario.nmLogin = "semNmLogin4848648"
            usuario.flTpEstabelecimento = EnumFlTpEstabelecimento.USER
            //usuario.urlfacebook = UserProfile.current?.profileURL?.absoluteString as! NSString
        }else{
            usuario.nome = nome as NSString
            usuario.email = email as NSString
        }
        
       CallRest.requestPostEntity(url: "usuario/salvar", entidade:usuario, callBack: self.callBackSalvarUsuario, callBackError: self.callBackErrorloadProfileFacebook)
    }
   
    func callBackSalvarUsuario(json:[String: AnyObject]) -> Void{
        let entidadeRetorno = Usuario()
        entidadeRetorno.setValuesForKeys(json)
        FacebookUtil.usuarioLogado = entidadeRetorno
        DispatchQueue.main.async() {
            [unowned self] in
            self.viewController.performSegue(withIdentifier: "segueMainToHome", sender:self.viewController )
        }
    }
    
    
}
