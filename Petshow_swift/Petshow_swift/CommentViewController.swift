//
//  CommentViewController.swift
//  Petshow_swift
//
//  Created by Bruno Salmito on 01/10/17.
//  Copyright © 2017 Bruno Salmito. All rights reserved.
//

import UIKit

class CommentViewController: UIViewController,UITextFieldDelegate {

    
    @IBOutlet var txtComent: UITextField!
    
    @IBOutlet var table: TableViewComment!
    
    @IBOutlet var buttonSalvar: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        txtComent.delegate = self
        table.rowHeight = UITableViewAutomaticDimension
        table.estimatedRowHeight = 150
        
        self.buttonSalvar.layer.cornerRadius = 8
        self.buttonSalvar.layer.masksToBounds = true
        self.view.backgroundColor = UIColor.blue
     }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
     func textFieldDidBeginEditing(_ textField: UITextField) {
       moveTextField( textField, moveDistance: -250, up: true)
       
    }
    
    @IBAction func salvarComment(_ sender: UIButton) {
        var comentario:Comentario  = Comentario()
        comentario.usuario = FacebookUtil.usuarioLogado
        comentario.descricao = NSString(string: txtComent.text!)
        comentario.dataInclusao = Date()
        Banco.addComentarios(comentario: comentario)
        table.comentarios = Banco.comentarios
        txtComent.text! = "" 
        txtComent.resignFirstResponder()
        buttonSalvar.resignFirstResponder()
    }
    
    @IBAction func back(_ sender: UIBarButtonItem) {
         self.dismiss(animated: true, completion: nil)
    }
    
    
     func textFieldDidEndEditing(_ textField: UITextField) {
         moveTextField( textField, moveDistance: 250, up: true)
        table.frame.offsetBy(dx: 0, dy: table.frame.size.height)
        
        let indexPath = IndexPath(row: (Banco.comentarios?.count)!-1, section: 0)
        self.table.scrollToRow(at: indexPath, at: .bottom, animated: true)
       
    }
    
     func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func moveTextField(_ textField: UITextField, moveDistance: Int, up: Bool) {
        let moveDuration = 0.2
        let movement: CGFloat = CGFloat(up ? moveDistance : -moveDistance)
        
        UIView.beginAnimations("animateTextField", context: nil)
        UIView.setAnimationBeginsFromCurrentState(true)
        UIView.setAnimationDuration(moveDuration)
        
        self.view.frame = self.view.frame.offsetBy(dx: 0, dy: movement)
        
        UIView.commitAnimations()
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

  

}
