//
//  ArticleModel.swift
//  NewAppTask
//
//  Created by Blink22 User on 23/08/2023.
//
import Foundation
// MARK: - Welcome

struct Welcome: Codable {
    let status, source, sortBy: String
    let articles: [Article]
}
// MARK: - Article
struct Article: Codable {
    var author, title, description: String
    var url: String
    var urlToImage: String
    var publishedAt: String
}


