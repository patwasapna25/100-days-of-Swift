//
//  ViewController.swift
//  MilestoneProject-Day59
//
//  Created by Sapna Patwa on 05/05/24.
//

import UIKit

class ViewController: UITableViewController {
    var countries = [Country]()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Countries"
        
        if let url = Bundle.main.url(forResource: "countries", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode(Countries.self, from: data)
                countries = jsonData.country
            } catch {
                print("Error: \(error)")
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        countries.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Country", for: indexPath)
        let country = countries[indexPath.row]
        cell.textLabel?.text = country.name
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let detailsVC = storyboard?.instantiateViewController(withIdentifier: "Details") as? DetailsTableViewController {
            detailsVC.country = countries[indexPath.row]
            navigationController?.pushViewController(detailsVC, animated: true)
        }
    }
}

