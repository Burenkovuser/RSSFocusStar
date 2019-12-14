//
//  IFeedPresenter.swift
//  RSSFocusStar
//
//  Created by Vasilii on 28.11.2019.
//  Copyright © 2019 Vasilii Burenkov. All rights reserved.
//

import Foundation

protocol IFeedPresenter {
    
    func inject(view: IFeedView)
    func onViewReadyEvent()
    
    func fetchData(completed: @escaping ()->Void)
    
    func numberOfRowsInSection(section: Int) -> Int
    func itemForRowAtIndexPath(indexPath: IndexPath) -> Article
}

