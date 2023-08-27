//
//  DetailModelView.swift
//  NewAppTask
//
//  Created by Blink22 User on 23/08/2023.
//

import Foundation
import UIKit
class DetailModelView {
    static var article : Article?
    
    
    init(detailArticle : Article ){
        var article = detailArticle
        article.publishedAt = helperMethods.dateFormat(date: article.publishedAt)
        DetailModelView.article=article
    }
}
