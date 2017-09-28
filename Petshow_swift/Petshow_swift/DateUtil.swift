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
    
    class func formartarNsDataBrasil (date:NSDate) -> String{
        let dateDescription = date.description
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let date = dateFormatter.date(from: dateDescription)!
        //(timeIntervalSince1970: date.timeIntervalSince1970)
        return formartarData (date:date,formato:"dd/MM/yyyy")
    }
    
    class func formartarNsDataBrasilJson (date:NSDate) -> String{
        let dateDescription = fullNSDateToDate(nsDate:date).description
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat =  "yyyy-MM-dd"
        let date = dateFormatter.date(from: dateDescription)
        //(timeIntervalSince1970: date.timeIntervalSince1970)
        return formartarData (date:date!,formato:"dd/MM/yyyy")
    }
    
    
    class func dataBrasilToDate (date:String) -> Date{
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        let date = dateFormatter.date(from: date)!
        
        return date
    }
    
    class func dataBrasilToNSDate (date:String) -> NSDate{
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        let dateObject = dateFormatter.date(from: date)!
        let date = NSDate.init(timeIntervalSinceNow: dateObject.timeIntervalSinceNow)
        
        return date
    }
    
    class func horaToNSDate (date:String,segundos:Bool) -> NSDate{
        
        let dateFormatter = DateFormatter()
        if(segundos){
            dateFormatter.dateFormat = "HH:mm:ss"
        }else{
             dateFormatter.dateFormat = "HH:mm"
        }
        let dateObject = dateFormatter.date(from: date)!
        let date = NSDate.init(timeIntervalSinceNow: dateObject.timeIntervalSinceNow)
        
        return date
    }
    class func formartarHora (date:Date,segundos:Bool) -> String{
        
        let dateFormatter = DateFormatter()
        if(segundos){
            dateFormatter.dateFormat = "HH:mm:ss"
        }else{
            dateFormatter.dateFormat = "HH:mm"
        }
        return dateFormatter.string(from: date)
        
        
    }
    
    class func formartarNsHora (date:NSDate,segundos:Bool) -> String{
        
        
        let hora = date.description
        
        var horaSplit = hora.components(separatedBy: ":")
        if(segundos){
           return horaSplit[0] + ":" + horaSplit[1] + ":" + horaSplit[2]
        }else{
            return horaSplit[0] + ":" + horaSplit[1] 
        }
        
    }
    class func fullNSDateToDate(nsDate:NSDate ) -> Date{
        return  Date.init(timeIntervalSince1970: nsDate.timeIntervalSince1970)
    }
    
    class func hourDescToDate(hour:String,seconds:Bool ) -> Date{
        
        var date:Date =  Date.init(timeIntervalSince1970: 0)
        
        if(seconds){
            date = date + secondsByDateOnlyHourWithSeconds(descHour:hour)
        }else{
            date = date + secondsByDateOnlyHourNoSeconds(descHour:hour)
        }
        return date
        
        
    }
    
    class func dateFromOnlyHour(nsDate:NSDate,seconds:Bool) -> Date {
        
        return hourDescToDate(hour: nsDate.description, seconds: seconds)
        
    }
    
    
    
    //entrada 23:55:55
    class func secondsByDateOnlyHourWithSeconds(descHour:String) -> Double{
        var horaSplit = descHour.components(separatedBy: ":")
        var seconds:Double = 0
        
        seconds += Double(horaSplit[2])!
        seconds += Double(horaSplit[1])!*60
        seconds += Double(horaSplit[0])!*60*60
        
        return seconds
    }
    //entrada 23:55
    class func secondsByDateOnlyHourNoSeconds(descHour:String) -> Double{
        var horaSplit = descHour.components(separatedBy: ":")
        var seconds:Double = 0
        
        
        seconds += Double(horaSplit[1])!*60
        seconds += Double(horaSplit[0])!*60*60
       
        return seconds
    }
    
    class func nsDateFormatToJson(date:NSDate) -> AnyObject{
        return DateUtil.formartarData(date: DateUtil.fullNSDateToDate(nsDate:(date)), formato: "yyyy-MM-dd"   ) as AnyObject
    }
    class func dateFormatToJson(date:Date?) -> AnyObject?{
        if(date == nil){
            return nil
        }
        return DateUtil.formartarData(date: date!, formato: "yyyy-MM-dd"   ) as AnyObject
    }
    
    class func hourFormatToJson(date:Date?) -> AnyObject?{
        if(date == nil){
            return nil
        }
        return DateUtil.formartarData(date: date!, formato: "yyyy-MM-dd'T'HH:mm:ss.SSSZ"   ) as AnyObject
    }
    
    class func formatResponseJson(dateString:Any?) ->Date?{
        if(dateString == nil){
            return nil
        }
        
        if let variavel = dateString as? NSNumber {
            let inteiro:Int64 = variavel.int64Value
            var date:Date = Date(timeIntervalSince1970:0)
            date = date + Double(inteiro/1000) + 1.0
            return date
        }
        else {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd"
            return dateFormatter.date(from: (dateString as! NSString).description )!
            
        }
       
                        
        
        
    }
    class func formatResponseHourJson(dateString:Any?) ->Date?{
        
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "hh:mm:ss"
        
            
            return dateFormatter.date(from: (dateString as! NSString).description )!
    }

}
