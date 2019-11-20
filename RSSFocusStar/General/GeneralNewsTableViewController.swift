//
//  GeneralNewsTableViewController.swift
//  RSSFocusStar
//
//  Created by Vasilii on 16.11.2019.
//  Copyright © 2019 Vasilii Burenkov. All rights reserved.
//

import UIKit

class GeneralNewsTableViewController: UITableViewController {
    
    private let identifier = "cell"
    
    // app trancport security
    
    private let urlNews = "https://newsapi.org/v2/everything?q=ru&publishedAt&apiKey=d746eb4b4bf04ac69851a310dc59a178"
    
    var artiles: [Article] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()

    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return artiles.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! MainCell
        let article = artiles[indexPath.row]
        cell.configur(with: article)

        return cell
    }
    
    func fetchData() {
        guard let url = URL(string: urlNews) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if let error = error {// если ошибка выходим из метода
                print(error.localizedDescription)
                return
            }
            if let response = response {
                print(response)
            }
            
            guard let data = data else { return }
            
                do {
                    self.artiles = try JSONDecoder().decode(RSSresponce.self, from: data).articles
                    DispatchQueue.main.async {
                      self.tableView.reloadData()
                   }
                    print(self.artiles)
                    
                } catch let ereor {
                    print(ereor.localizedDescription)
                }
            }.resume()
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

extension GeneralNewsTableViewController: IGeneralViewController {
    func setupInitialState() {
        title = "NEWS"
    }
}
