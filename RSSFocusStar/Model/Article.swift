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
}


struct Sourse: Decodable {
    let id: String?
    let name: String?
}
