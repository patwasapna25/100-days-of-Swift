//
//  DetailsTableViewController.swift
//  MilestoneProject-Day59
//
//  Created by Sapna Patwa on 05/05/24.
//

import UIKit

class DetailsTableViewController: UITableViewController {
    var country: Country?
    let info = ["Name", "id", "alpha1", "alpha2"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Country Details"
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        info.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Detail", for: indexPath)
        var rowText = ""
        if let country {
            switch indexPath.row {
            case 0:
                rowText = "Name: \(country.name)"
            case 1:
                rowText = "id: \(country.id)"
            case 2: 
                rowText = "alpha2: \(country.alpha2)"
            case 3:
                rowText = "alpha3: \(country.alpha3)"
            default:
                break
            }
        }        
        cell.textLabel?.text = rowText
        return cell
    }

}
