//
//  IGeneralViewController.swift
//  RSSFocusStar
//
//  Created by Vasilii on 17.11.2019.
//  Copyright © 2019 Vasilii Burenkov. All rights reserved.
//

import Foundation

protocol IGeneralViewController: AnyObject {
    func setupInitialState()
}

protocol IOnBoardingPresenter: AnyObject {
    func onViewReadyEvent()
}
