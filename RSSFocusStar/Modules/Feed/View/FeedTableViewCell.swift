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
        
        if let date = article.published {
            publishedatLabel.text = type(of: self).formatter.string(from: date)
        }
        else {
            publishedatLabel.text = nil
        }
    }
    
    private static let formatter: DateFormatter = {
        let result = DateFormatter()
        result.dateFormat = "dd-MM-yyyy"
        return result
    }()
}
