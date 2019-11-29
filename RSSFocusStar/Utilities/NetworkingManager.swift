//
//  NetworkingManager.swift
//  RSSFocusStar
//
//  Created by Vasilii on 25.11.2019.
//  Copyright © 2019 Vasilii Burenkov. All rights reserved.
//

import Foundation

protocol INetworkManager: AnyObject {
    func loadSpaceArticle(completion: @escaping (Result<RSSresponce, Error>) -> Void)
    func loadImage(completion: @escaping (Result<Data, Error>) -> Void)
}


final class NetworkManager {
    private let session: URLSession
    
    init(sessionConfiguration: URLSessionConfiguration) {
        self.session = URLSession(configuration: sessionConfiguration)
    }
    
}
