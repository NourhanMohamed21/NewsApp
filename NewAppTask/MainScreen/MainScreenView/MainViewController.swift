//
//  MainViewController.swift
//  NewAppTask
//
//  Created by Blink22 User on 23/08/2023.
//

import UIKit

class MainViewController: UIViewController {
    
    var CellDataSource : [TableCellViewModel] = []
    var rows:Int = 0
    var sections : Int = 0
    var loading: Bool = false
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "News Home"
        getData()
        setUpTableView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        reloadTableView()
        setUpTableView()
    }
    
    func openDetails(articleTitle: String){
        guard let article = getDataByTitle(title: articleTitle)else{
            return
        }
        let detailsViewModel = DetailModelView(detailArticle:article)
        let detailsController = DetailViewController(viewModel: detailsViewModel)
        DispatchQueue.main.async {
            self.navigationController?.pushViewController(detailsController, animated: true)
            
        }
    }
}

extension MainViewController : bindMainViewModelWithVC{
    
    func setLoading(loading: Bool) {
        self.loading = loading
        DispatchQueue.main.async {
            if loading {
                self.activityIndicator.startAnimating()
            }
            else{
                self.activityIndicator.stopAnimating()
                
            }
        }
    }
    func isLoading() -> Bool {
        return self.loading
    }
    
    func getSectionsNum(sec: Int) {
        self.sections = sec
    }
    func getRowsNum(rows: Int){
        self.rows = rows
    }
    func fetchCells(cells: [TableCellViewModel]) {
        self.CellDataSource=cells
        reloadTableView()
    }
    
}
