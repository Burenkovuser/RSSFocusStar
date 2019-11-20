//
//  MainCell.swift
//  RSSFocusStar
//
//  Created by Vasilii on 17.11.2019.
//  Copyright © 2019 Vasilii Burenkov. All rights reserved.
//

import UIKit

class MainCell: UITableViewCell {
    
    @IBOutlet weak var articleImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var publishedatLabel: UILabel!

    func configur (with article: Article) {
        
        titleLabel.text = article.title
        authorLabel.text = article.author
        publishedatLabel.text = article.publishedAt
        
        /*
        DispatchQueue.main.async {
            self.titleLabel.text = article.title
            self.authorLabel.text = article.author
            self.publishedatLabel.text = article.publishedAt
        }
        */
        
        
        /*
        DispatchQueue.global().async {
            guard let imageURL = URL(string: article.urlToImage!) else { return }
            guard let imageData = try? Data(contentsOf: imageURL) else { return }
            DispatchQueue.main.async {
                self.articleImage.image = UIImage(data: imageData)
            }
        } */
    }

}
