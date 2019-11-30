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

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}


