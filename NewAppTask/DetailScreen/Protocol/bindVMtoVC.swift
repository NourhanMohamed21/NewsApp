//
//  bindVMtoVC.swift
//  NewAppTask
//
//  Created by Blink22 User on 27/08/2023.
//

import Foundation
protocol bindVNtoVC{
    
}
extension bindVNtoVC{
    func setUP()->Article?{
        return DetailModelView.article ?? nil
    }
}
