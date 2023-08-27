//
//  TableCellViewModel.swift
//  NewAppTask
//
//  Created by Blink22 User on 24/08/2023.
//

import Foundation
import UIKit
class TableCellViewModel {
    
    var url : String?
    var title: String
    var pubDate: String = ""
    
    init(article : Article){
        self.title = article.title
        self.pubDate = helperMethods.dateFormat(date: article.publishedAt)
        self.url = article.urlToImage
    }
}
