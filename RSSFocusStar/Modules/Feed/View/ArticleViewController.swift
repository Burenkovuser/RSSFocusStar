//
//  ArticleViewController.swift
//  RSSFocusStar
//
//  Created by Vasilii on 30.11.2019.
//  Copyright © 2019 Vasilii Burenkov. All rights reserved.
//

import UIKit
import WebKit

class ArticleViewController: UIViewController {

    @IBOutlet weak var detailImage: UIImageView!
    @IBOutlet weak var detailTitleLabel: UILabel!
    @IBOutlet weak var detailTextView: UITextView!
    @IBOutlet weak var detailAuthorLabel: UILabel!
    @IBOutlet weak var detailDateLabel: UILabel!
    
    var article: Article?
    
    private let placeHolderImage = UIImage(named: "placeholder.png")
    
    let presenter: IArticlePresetner = ArticlePresenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.inject(view: self)
        presenter.onViewReadyEvent()
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
       
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         if segue.identifier == "showWeb" {
             let vc = segue.destination as! WebViewController
           
           vc.url = article?.url
         }
    }
}

extension ArticleViewController: IArticleView {
    func setupInitialStateWith(article: Article) {
        self.article = article
        detailTitleLabel.text = article.title
        detailTextView.text = article.description
        detailAuthorLabel.text = article.author
        //detailDateLabel.text = article.publishedAt
        
        let url: URL? = {
            if let string = article.urlToImage {
                       return URL(string: string)
                   } else {
                       return nil
                   }
               }()
        
        detailImage.sd_setImage(with: url,  placeholderImage: placeHolderImage)
    }
    
}
