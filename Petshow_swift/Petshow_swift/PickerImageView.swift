//
//  PickerImageView.swift
//  Petshow_swift
//
//  Created by Bruno Salmito on 26/09/17.
//  Copyright © 2017 Bruno Salmito. All rights reserved.
//

import UIKit

class PickerImageView:UIImageView,UIImagePickerControllerDelegate,UINavigationControllerDelegate  {
    
    var controller:UIViewController?
    
   
    required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(criationOptionSheet))
        self.isUserInteractionEnabled = true
        self.addGestureRecognizer(tapGestureRecognizer)
       
    }
    func prepare (controller:UIViewController){
        self.controller = controller
    }
    
    
    func openphoto() {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = .photoLibrary;
            imagePicker.allowsEditing = true
            controller?.present(imagePicker, animated: true, completion: nil)
        }
    }
    
    func openCamera() {
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = .camera;
            imagePicker.allowsEditing = false
            controller?.present(imagePicker, animated: true, completion: nil)
        }
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        picker.dismiss(animated: true, completion: nil)
        
        self.image = resizeImage(image: (info[UIImagePickerControllerOriginalImage] as? UIImage)!, newWidth: 150)
       
        
       
        
        
        
        
    }
    
    
    func resizeImage(image: UIImage, newWidth: CGFloat) -> UIImage {
        
        let scale = newWidth / image.size.width
        
        let newHeight = image.size.height * scale
        
        UIGraphicsBeginImageContext(CGSize(width: newWidth, height: newHeight))
        
        image.draw(in: CGRect(x: 0, y: 0, width: newWidth, height: newHeight))
        
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage!
    }
    
    
    func criationOptionSheet(){
        
        let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        let actionCamera = UIAlertAction(title: "Camera", style: UIAlertActionStyle.default) {
            UIAlertAction in
            
            self.openCamera()
        }
        
        let actrionGaleria = UIAlertAction(title: "Galeria", style: UIAlertActionStyle.default) {
            UIAlertAction in
            self.openphoto()
        }
        let cancelAction = UIAlertAction(title: "Cancelar", style: UIAlertActionStyle.cancel) {
            UIAlertAction in
            
        }
        
        alertController.addAction(actionCamera)
        alertController.addAction(actrionGaleria)
        alertController.addAction(cancelAction)
        
        
        controller?.present(alertController, animated: true, completion: nil)
        
    }


}
