//
//  DetailViewController.swift
//  NewAppTask
//
//  Created by Blink22 User on 23/08/2023.
//

import UIKit
import AlamofireImage

class DetailViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UITextView!
    @IBOutlet weak var authorLabel: UILabel!
    @IBAction func toUrlBtn(_ sender: UIButton) {
        if let url = URL(string: self.urlTOweb ?? "") {
            UIApplication.shared.open(url)
        }
    }
    
    var urlTOweb: String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "News Details"
        configview()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        configview()
    }
    
    func configview(){
        let article = setUP()
        titleLabel.text = article?.title
        descriptionLabel.text = article?.description
        dateLabel.text = article?.publishedAt
        authorLabel.text = article?.author
        imageView.af.setImage(withURL:URL(string: article?.urlToImage ?? "" )!, placeholderImage: UIImage(named: "NO_IMAGE" ))
        self.urlTOweb = article?.url
    }
    init(viewModel: DetailModelView){
        super.init(nibName: "DetailViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
extension DetailViewController:bindVNtoVC{
    
}
