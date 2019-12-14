//
//  ArticlePresetner.swift
//  RSSFocusStar
//
//  Created by Vasilii on 30.11.2019.
//  Copyright © 2019 Vasilii Burenkov. All rights reserved.
//

import Foundation

final class ArticlePresenter: IArticlePresetner {
    
    private weak var view: IArticleView?
    private var article: Article!
    func inject(view: IArticleView){
        self.view = view
    }
    
    func set(article:Article){
        self.article = article
    }
    
    func onViewReadyEvent(){
        view?.setupInitialStateWith(article: article)
    }
}
