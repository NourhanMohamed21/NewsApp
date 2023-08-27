//
//  helperMethods.swift
//  NewAppTask
//
//  Created by Blink22 User on 24/08/2023.
//

import Foundation

class helperMethods{
    static func dateFormat(date:String)->String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy'-'MM'-'dd'T'HH':'mm':'ssZZZ"
        guard let date = dateFormatter.date(from: date) else { return  "" }
        dateFormatter.dateFormat = "dd-MM-yyyy"
        let dateF = dateFormatter.string(from: date)
        return dateF
    }
}
