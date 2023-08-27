//
//  TableCellView.swift
//  NewAppTask
//
//  Created by Blink22 User on 23/08/2023.
//

import UIKit
import AlamofireImage

class TableCellView: UITableViewCell {
    
    public static var identifier:  String{
        get {
            return "MainCell"
        }
    }
    
    @IBOutlet weak var atricleImageView: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    
    public static func register ()->UINib{
        
        return UINib(nibName: "TableCellView", bundle: nil)
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setupCell(viewModel: TableCellViewModel){
        
        self.layer.backgroundColor = UIColor.clear.cgColor
        self.title.text = viewModel.title
        self.dateLabel.text = viewModel.pubDate
        atricleImageView.af.setImage(withURL:URL(string: viewModel.url ?? "")!, placeholderImage: UIImage(named: "NO_IMAGE" ))
        
    }
    
}
