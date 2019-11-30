//
//  MainCell.swift
//  RSSFocusStar
//
//  Created by Vasilii on 17.11.2019.
//  Copyright © 2019 Vasilii Burenkov. All rights reserved.
//

import UIKit

class FeedTableViewCell: UITableViewCell {
    
    @IBOutlet weak var articleImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var publishedatLabel: UILabel!

     func configur (with article: Article) {
        
        titleLabel.text = article.title
        authorLabel.text = article.author
        publishedatLabel.text = article.publishedAt
    }
}
