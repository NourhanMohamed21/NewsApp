//
//  APICaller.swift
//  NewAppTask
//
//  Created by Blink22 User on 23/08/2023.
//

import Foundation
import Alamofire

import AlamofireImage


public class APICaller {
    
    static func getArticles(completionHandler : @escaping (_ result:Result<Welcome,Error>) -> Void  ){
        let urlSrting = "https://newsapi.org/v1/articles?source=techcrunch&apiKey=7e7662aebb8e49d0a03b302047852db9"
        AF.request(urlSrting)
            .validate()
            .response{(response) in
                switch response.result{
                case .success(let data):
                    if let datares = data,
                       let resultData =  try? JSONDecoder().decode(Welcome.self, from: datares )
                    {
                        completionHandler(.success(resultData))
                    }
                case .failure(let error):
                    completionHandler(.failure(error))
                }
            }
    }
}

