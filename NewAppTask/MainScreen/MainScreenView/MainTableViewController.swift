//
//  MainTableViewController.swift
//  NewAppTask
//
//  Created by Blink22 User on 23/08/2023.
//

import UIKit

extension MainViewController:  UITableViewDataSource , UITableViewDelegate {
    
    
    func setUpTableView(){
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.registerCell()
    }
    
    func registerCell(){
        self.tableView.register(TableCellView.register(), forCellReuseIdentifier: TableCellView.identifier)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.sections
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.rows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier:
                                                        "MainCell", for: indexPath) as? TableCellView else{
            return UITableViewCell()
        }
        tableView.deselectRow(at: indexPath, animated: true)
        cell.layer.backgroundColor = UIColor.clear.cgColor
        
        let blueView = UIView(frame: cell.bounds)
        blueView.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0)
        cell.selectedBackgroundView = blueView
        cell.setupCell(viewModel: CellDataSource[indexPath.row])
        return cell
    }
    
    func reloadTableView(){
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        150
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard let cell = tableView.cellForRow(at: indexPath) else{ return}
        let blueView = UIView(frame: cell.bounds)
        blueView.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        cell.selectedBackgroundView = blueView
        let articleKey = CellDataSource[indexPath.row].title
        self.openDetails(articleTitle: articleKey)
    }
    
}
