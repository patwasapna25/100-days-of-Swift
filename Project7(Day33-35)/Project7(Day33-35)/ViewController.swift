//
//  ViewController.swift
//  Project7(Day33-35)
//
//  Created by Sapna Patwa on 07/04/24.
//

import UIKit

class ViewController: UITableViewController {
    var petitions = [Petition]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let urlString = "https://www.hackingwithswift.com/samples/petitions-1.json"
        if let url = URL(string: urlString) {
            if let data = try? Data(contentsOf: url) {
                // we are OK to parse
                parse(json: data)
            }
        }
        title = "Petitons"
    }
    
    func parse(json: Data) {
        let decoder = JSONDecoder()
        
        do {
            let jsonPetitions = try decoder.decode(Petitions.self, from: json)
            petitions = jsonPetitions.results
            tableView.reloadData()
          } catch {
            print("Error decoding JSON: \(error)")
            // Handle the error here, maybe display an alert to the user
          }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return petitions.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let petition = petitions[indexPath.row]
        cell.textLabel?.text = petition.title
        cell.detailTextLabel?.text = petition.body
        return cell
    }
}

