//
//  WebViewController.swift
//  RSSFocusStar
//
//  Created by Vasilii on 30.11.2019.
//  Copyright © 2019 Vasilii Burenkov. All rights reserved.
//

import UIKit
import WebKit

final class WebViewController: UIViewController {
    
    @IBOutlet private weak var articleWeb: WKWebView!
    @IBOutlet private weak var activity: UIActivityIndicatorView!
    
    var url: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    
        guard let url = url else { return }
        let request = URLRequest(url: URL(string: url)!)
        self.articleWeb.load(request)
        
        self.articleWeb.addObserver(self, forKeyPath: #keyPath(WKWebView.isLoading), options: .new, context: nil)
        }
        
    override func observeValue(forKeyPath keyPath: String?, of: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
            
            if keyPath == "loading" {
                
                if articleWeb.isLoading {
                                            activity.startAnimating()
                                            activity.isHidden = false
                                   } else {
                                             activity.stopAnimating()
                                             activity.isHidden = true
            }
        }
    }
}
