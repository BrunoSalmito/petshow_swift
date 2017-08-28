//
//  ImageUtil.swift
//  Petshow
//
//  Created by Bruno Salmito on 19/07/17.
//  Copyright © 2017 Bruno Salmito. All rights reserved.
//

import UIKit

class ImageUtil{
    
    class func string64ToImage(stringImage:String) -> UIImage{
        let dataDecoded : Data = Data(base64Encoded: stringImage, options: .ignoreUnknownCharacters)!
        return UIImage(data:dataDecoded)!
        
        
    }
    class func nsString64ToImage(stringImage:NSString) -> UIImage{
        
        let image:String = (stringImage as? String)!
        return string64ToImage(stringImage:image)
        
        
    }
    
    class func imageToString64(image:UIImage) -> String{
        
        let imageData:NSData = UIImagePNGRepresentation(image)! as NSData
        return imageData.base64EncodedString(options: .lineLength64Characters)
        
        
    }
    
    class func imageToNSString64(image:UIImage) -> NSString{
        let stringAux:String = imageToString64(image:image)
        return NSString(string: stringAux)
    }
    
    
}
