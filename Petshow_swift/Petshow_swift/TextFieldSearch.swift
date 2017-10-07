//
//  TextFieldSearch.swift
//  Petshow_swift
//
//  Created by Bruno Salmito on 27/09/17.
//  Copyright © 2017 Bruno Salmito. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit
import GooglePlacesSearchController


class TextFieldSearch:UITextField,UITextFieldDelegate {

    
    var placeSelected:(PlaceDetails)?
    var controller:UIViewController?

   
   
    func prepare(controller:UIViewController){
        self.controller = controller
        
        self.addTarget(self, action: #selector(openGoogleAutoComplete), for: UIControlEvents.editingDidBegin)

        
    }
    
    func openGoogleAutoComplete(sender: TextFieldSearch) {
        
        
        let controller = GooglePlacesSearchController(apiKey: ParametrosUtil.key.GOOGLE_SEARCH_API_KEY , placeType:PlaceType.address)
        
        controller.didSelectGooglePlace{ (place) -> Void in
            //print(place.description)
            controller.isActive = false
            self.placeSelected = place
            sender.text = place.formattedAddress
        }
        
        self.controller?.present(controller, animated: true, completion: nil)
    }
    

}
