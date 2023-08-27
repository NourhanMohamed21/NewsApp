//
//  bindMainViewModelWithVC.swift
//  NewAppTask
//
//  Created by Blink22 User on 24/08/2023.
//

import Foundation
protocol bindMainViewModelWithVC: AnyObject{
    
    func fetchCells(cells: [TableCellViewModel])
    func isLoading()->Bool
    func setLoading(loading:Bool)
    func getRowsNum(rows:Int)
    func getSectionsNum(sec:Int)
    var rows : Int {get}
    //    func getDataByTitle(title:String)
}
extension bindMainViewModelWithVC{
    
    func getData(){
        let modelview = MainModelView()
        if isLoading() {
            return
        }
        else{
            setLoading(loading: true)
            APICaller.getArticles { [weak self] result in
                self?.setLoading(loading: false)
                switch result{
                case .success(let data):
                    MainModelView.dataSource = data
                    self?.fetchCells(cells:  modelview.mapCellsData())
                    self?.getRowsNum(rows: modelview.getRowsNumber())
                    self?.getSectionsNum(sec: modelview.getSectionNumber())
                case .failure(let error):
                    print(error)
                }
            }
        }
    }
    func getDataByTitle(title:String)->Article?{
        let modelview = MainModelView()
        guard let article = modelview.getDataByTitle(title: title) else{
            return nil}
        return article
    }
}
