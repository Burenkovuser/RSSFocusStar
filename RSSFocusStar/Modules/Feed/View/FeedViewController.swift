//
//  GeneralNewsTableViewController.swift
//  RSSFocusStar
//
//  Created by Vasilii on 16.11.2019.
//  Copyright © 2019 Vasilii Burenkov. All rights reserved.
//

import UIKit
import SDWebImage

class FeedViewController: UITableViewController, IFeedView {
    
    private let identifier = "FeedTableViewCell"
    private let presenter = FeedPresenter()
    private var selectedIndexPath = IndexPath()
    private let placeHolderImage = UIImage(named: "placeholder.png")

    override func viewDidLoad() {
        super.viewDidLoad()
        setupInitialState()
        self.presenter.inject(view: self)
        
        self.presenter.fetchData { [weak self] in
            self?.tableView.reloadData()
        }
    }
    
    func setupInitialState() {
           title = "News"
          tableView.register(FeedTableViewCell.self, forCellReuseIdentifier: identifier)
          tableView.register(UINib(nibName: "FeedTableViewCell", bundle: nil), forCellReuseIdentifier: identifier) // сделать ячейку
      }

    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.numberOfRowsInSection(section: section)
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "FeedTableViewCell", for: indexPath) as! FeedTableViewCell
        let item = presenter.itemForRowAtIndexPath(indexPath: indexPath)
        
        
        let url: URL? = {
            if let string = item.urlToImage {
                return URL(string: string)
            } else {
                return nil
            }
        }()
        
        cell.articleImage?.sd_setImage(
            with: url,
            placeholderImage: placeHolderImage)
 

        cell.configur(with: item)
        
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.selectedIndexPath = indexPath
        self.performSegue(withIdentifier: "openCell", sender: indexPath)
    }
    
    override func prepare(for segue: UIStoryboardSegue , sender: Any?) {
        if segue.identifier == "openCell" {
            let vc = segue.destination as! ArticleViewController
            
            let item = presenter.itemForRowAtIndexPath(indexPath:selectedIndexPath)
            vc.presenter.set(article:item)
            
        }
    }
}


