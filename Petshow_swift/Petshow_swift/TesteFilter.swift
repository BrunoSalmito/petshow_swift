//
//  TesteFilter.swift
//  Petshow_swift
//
//  Created by Bruno Salmito on 06/10/17.
//  Copyright © 2017 Bruno Salmito. All rights reserved.
//

import UIKit

class TesteFilter:UIViewController {
    
    
    var CIFilterNames = [
        "CIPhotoEffectChrome",
        "CIPhotoEffectFade",
        "CIPhotoEffectInstant",
        "CIPhotoEffectNoir",
        "CIPhotoEffectProcess",
        "CIPhotoEffectTonal",
        "CIPhotoEffectTransfer",
        "CISepiaTone"
    ]
    
    @IBOutlet var imageFiltrada: UIImageView!
    @IBOutlet var scroll: UIScrollView!
    @IBOutlet var imageFiltrada2: UIImageView!
    
    @IBOutlet var uiViewInternal: UIView!
    
    
    
    @IBAction func salvarImagem(_ sender: Any) {
        
        UIImageWriteToSavedPhotosAlbum(imageFiltrada2.image!, nil, nil, nil)
        
        let alert = UIAlertView(title: "Filters",
                                message: "Your image has been saved to Photo Library",
                                delegate: nil,
                                cancelButtonTitle: "OK")
        alert.show()
    }
    
//    override func prefersStatusBarHidden() -> Bool {
//        return true
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var xCoord: CGFloat = 5
        let yCoord: CGFloat = 5
        let buttonWidth:CGFloat = 70
        let buttonHeight: CGFloat = 70
        let gapBetweenButtons: CGFloat = 5
        
        var itemCount = 0
        
        for i in 0..<CIFilterNames.count {
            itemCount = i
            
            // Button properties
            let filterButton = UIButton(type: .custom)
            filterButton.frame =   CGRect(x: xCoord, y: yCoord, width: buttonWidth, height: buttonHeight)
            
            filterButton.tag = itemCount
            filterButton.addTarget(self, action: #selector(self.filterButtonTapped), for: .touchUpInside)
            filterButton.layer.cornerRadius = 6
            filterButton.clipsToBounds = true
    
            let ciContext = CIContext(options: nil)
            let coreImage = CIImage(image: imageFiltrada.image!)
            let filter = CIFilter(name: "\(CIFilterNames[i])" )
            filter!.setDefaults()
            filter!.setValue(coreImage, forKey: kCIInputImageKey)
            let filteredImageData = filter!.value(forKey: kCIOutputImageKey) as! CIImage
            let filteredImageRef = ciContext.createCGImage(filteredImageData, from: filteredImageData.extent)
            let imageForButton = UIImage(cgImage: filteredImageRef!)
                
            
            filterButton.setBackgroundImage(imageForButton, for: .normal)
            // Add Buttons in the Scroll View
            xCoord +=  buttonWidth + gapBetweenButtons
            scroll.addSubview(filterButton)
        } // END FOR LOOP
        
        
        // Resize Scroll View
        scroll.contentSize = CGSize(width: buttonWidth * CGFloat(itemCount+2), height: yCoord)
            
            
      
        
    } // END viewDidload()
    
    
    func filterButtonTapped(sender: UIButton) {
        let button = sender as UIButton
        
        imageFiltrada2.image = button.backgroundImage(for: UIControlState.normal)
    }
    
}
