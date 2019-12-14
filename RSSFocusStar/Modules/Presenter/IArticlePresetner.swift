//
//  IArticlePresetner.swift
//  RSSFocusStar
//
//  Created by Vasilii on 30.11.2019.
//  Copyright © 2019 Vasilii Burenkov. All rights reserved.
//

import Foundation

protocol IArticlePresetner {
    func inject(view: IArticleView)
    func set(article:Article)
    func onViewReadyEvent()
}

protocol IArticleView: AnyObject {
    func setupInitialStateWith(article:Article)
}
