//
//  Postagem.swift
//  Petshow_swift
//
//  Created by Bruno Salmito on 29/09/17.
//  Copyright © 2017 Bruno Salmito. All rights reserved.
//

import UIKit


class Postagem:Entidade{
    
    var   datePostagem:Date!
    var   foto:NSString?
    var   descPostagem:NSString?
    var   usuario:Usuario?
    
    
    
    override func setValue(_ value: Any?, forKey key: String) {
        if key=="datePostagem"{
            self.datePostagem = DateUtil.formatResponseJson(dateString: value )
            
        }else{
            super.setValue(value, forKey: key)
        }
        
        
        
    }
    
    override func toJSON() -> Dictionary<String, AnyObject> {
        
        return[
            "id":(self.id  as AnyObject),
            "foto":(self.foto  as AnyObject),
            "datePostagem":DateUtil.dateFormatToJson(date:self.datePostagem) as AnyObject,
            "usuario":usuario?.toJSON() as AnyObject,
            "descPostagem":(self.foto  as AnyObject),
          ]
    }

    static func criarPostagensTeste() -> [Postagem]{
        
        
        var postagem1:Postagem = Postagem()
        postagem1.usuario = FacebookUtil.usuarioLogado
        postagem1.datePostagem = DateUtil.dataBrasilToDate(date: "15/05/2017")
        postagem1.foto = ImageUtil.imageToNSString64(image: UIImage(named: "aa")! )
        postagem1.descPostagem = "Brincando na praça com os amigos 1"
        var postagem2:Postagem = Postagem()
        postagem2.usuario = FacebookUtil.usuarioLogado
        postagem2.datePostagem = DateUtil.dataBrasilToDate(date: "15/05/2017")
        postagem2.foto = ImageUtil.imageToNSString64(image: UIImage(named: "bb")! )
        postagem2.descPostagem = "Brincando na praça com os amigos 2"
        var postagem3:Postagem = Postagem()
        postagem3.usuario = FacebookUtil.usuarioLogado
        postagem3.datePostagem = DateUtil.dataBrasilToDate(date: "15/05/2017")
        postagem3.foto = ImageUtil.imageToNSString64(image: UIImage(named: "cc")! )
        postagem3.descPostagem = "Brincando na praça com os amigos 3"
        var postagem4:Postagem = Postagem()
        postagem4.usuario = FacebookUtil.usuarioLogado
        postagem4.datePostagem = DateUtil.dataBrasilToDate(date: "15/05/2017")
        postagem4.foto = ImageUtil.imageToNSString64(image: UIImage(named: "ddd")! )
        postagem4.descPostagem = "Brincando na praça com os amigos 4"
        
        var postagens:[Postagem] = [Postagem()]
        postagens.removeAll()
        postagens.append(postagem1)
        postagens.append(postagem3)
        postagens.append(postagem2)
        postagens.append(postagem4)
        return postagens
    }
    
}
