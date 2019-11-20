//
//  GeneralPresenter.swift
//  RSSFocusStar
//
//  Created by Vasilii on 17.11.2019.
//  Copyright © 2019 Vasilii Burenkov. All rights reserved.
//

import Foundation

final class GeneralPresenter: IGeneralViewController {
    
    private weak var view: IGeneralViewController?
    
    init(view: IGeneralViewController) {
        self.view = view
    }
    
    func setupInitialState() {
         
     }
     
   func onViewReadyEvent() {
       view?.setupInitialState()
   }
      
}
