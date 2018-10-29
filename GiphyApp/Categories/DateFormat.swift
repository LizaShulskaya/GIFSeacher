//
//  DateFormat.swift
//  GiphyApp
//
//  Created by lizaveta shulskaya on 10/29/18.
//  Copyright © 2018 lizaveta shulskaya. All rights reserved.
//

import Foundation


extension String{
    static func convertDateFrom(date: String) -> String?{
                let dateFormatterGet = DateFormatter()
                dateFormatterGet.dateFormat = "\(dateFormats.oldFormat)"
        
                let dateFormatterPrint = DateFormatter()
                dateFormatterPrint.dateFormat = "\(dateFormats.newFormat)"
        
        if let getDate = dateFormatterGet.date(from: date){
            let dateForLabel = dateFormatterPrint.string(from: getDate)
            return dateForLabel
        }
        return nil
    }
}
