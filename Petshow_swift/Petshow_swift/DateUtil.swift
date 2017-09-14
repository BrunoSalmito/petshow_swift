//
//  DateUtil.swift
//  Petshow_swift
//
//  Created by Bruno Salmito on 12/09/17.
//  Copyright © 2017 Bruno Salmito. All rights reserved.
//

import Foundation
class DateUtil{
    
    class func formartarDataBrasil (date:Date) -> String{
        
        return formartarData (date:date,formato:"dd/MM/yyyy")
    }
    
    class func formartarData (date:Date,formato:String) -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = formato
        return dateFormatter.string(from: date)
    }
}
