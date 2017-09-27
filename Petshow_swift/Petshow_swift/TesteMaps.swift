//
//  TesteMaps.swift
//  Petshow_swift
//
//  Created by Bruno Salmito on 27/09/17.
//  Copyright © 2017 Bruno Salmito. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit
import GooglePlacesSearchController


class TesteMaps: UIViewController {

    let GoogleSearchPlaceAPIKey = "AIzaSyB59U4AnK1Sj06yOWH8pc4brsTTQyCO3Uk"
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
        // Do any additional setup after loading the view.
    }
    func action(){
       
    }
    @IBAction func aaaa(_ sender: UITextField) {
        let controller = GooglePlacesSearchController(apiKey: GoogleSearchPlaceAPIKey , placeType:PlaceType.address)
        
        controller.didSelectGooglePlace{ (place) -> Void in
            print(place.description)
            controller.isActive = false
            
        }
        
        present(controller, animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
