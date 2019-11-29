//
//  SessionConfiguration.swift
//  RSSFocusStar
//
//  Created by Vasilii on 25.11.2019.
//  Copyright © 2019 Vasilii Burenkov. All rights reserved.
//

import Foundation

protocol ISessionConfigurationFactory {
    func common() -> URLSessionConfiguration
}

struct SessionConfigurationFactory {

}

extension SessionConfigurationFactory: ISessionConfigurationFactory {
    func common() -> URLSessionConfiguration {
        return URLSessionConfiguration.`default`
    }
}
