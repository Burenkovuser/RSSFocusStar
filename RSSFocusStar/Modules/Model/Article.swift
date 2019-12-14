//
//  Article.swift
//  RSSFocusStar
//
//  Created by Vasilii on 17.11.2019.
//  Copyright © 2019 Vasilii Burenkov. All rights reserved.
//

import Foundation

struct Article: Decodable {
    let sourse: Sourse?
    let author: String?
    let title: String?
    let description: String?
    let url: String?
    let urlToImage: String?
    let publishedAt: String?
    
    var published: Date? {
        guard let string = self.publishedAt else { return nil }
        return type(of: self).formatter.date(from: string)
    }
    
    private static let formatter: DateFormatter = {
        let result = DateFormatter()
        result.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        return result
    }()
}

struct Sourse: Decodable {
    let id: String?
    let name: String?
}
