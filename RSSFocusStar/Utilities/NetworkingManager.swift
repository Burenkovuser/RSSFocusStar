//
//  NetworkingManager.swift
//  RSSFocusStar
//
//  Created by Vasilii on 25.11.2019.
//  Copyright © 2019 Vasilii Burenkov. All rights reserved.
//

import Foundation

protocol INetworkManager: AnyObject {
    
}

 class NetworkManager {
    private let urlNews = "https://newsapi.org/v2/everything?q=ru&publishedAt&apiKey=22ef75460b784f7ba10564e713a039df"
    
    private var artiсles: [Article] = []
    
    func fetchData(completed: @escaping ()->Void) {
        guard let url = URL(string: urlNews) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if let error = error {
                print(error.localizedDescription)
                return
            }
            if let response = response {
                print(response)
            }
            
            guard let data = data else { return }
            
                do {
                    self.artiсles = try JSONDecoder().decode(RSSresponce.self, from: data).articles
                    DispatchQueue.main.async {
                      completed()
                   }
                    //print(self.artiсles)
                    
                } catch let ereor {
                    print(ereor.localizedDescription)
                }
            }.resume()
    }
}
