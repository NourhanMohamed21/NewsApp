//
//  MainMOdelView.swift
//  NewAppTask
//
//  Created by Blink22 User on 23/08/2023.
//

import Foundation

class MainModelView{
    
    var delegate: bindMainViewModelWithVC?
    static var dataSource : Welcome?
    var cells:[TableCellViewModel]=[]
    
    
    func getRowsNumber()->Int
    {
        return cells.count
    }
    
    func getSectionNumber()->Int{
        return 1
    }
    func mapCellsData()->[TableCellViewModel]{
        
        self.cells = MainModelView.dataSource?.articles.compactMap({TableCellViewModel(article: $0)}) ?? []
        return cells
    }
    
    func getDataByTitle(title:String)->Article?{
        guard let article = MainModelView.dataSource?.articles.first(where: {$0.title == title})
        else{
            return nil
        }
        return article
        
    }
}
