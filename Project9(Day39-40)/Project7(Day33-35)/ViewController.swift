//
//  ViewController.swift
//  Project7(Day33-35)
//
//  Created by Sapna Patwa on 07/04/24.
//

import UIKit

class ViewController: UITableViewController {
    var petitions = [Petition]()
    var filteredPetitions = [Petition]()

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Credits", style: .plain, target: self, action: #selector(showCredits))
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Search", style: .plain, target: self, action: #selector(filterPetitions))
        
//        let urlString: String
//
//        if navigationController?.tabBarItem.tag == 0 {
//            // urlString = "https://api.whitehouse.gov/v1/petitions.json?limit=100"
//            urlString = "https://www.hackingwithswift.com/samples/petitions-1.json"
//        } else {
//            // urlString = "https://api.whitehouse.gov/v1/petitions.json?signatureCountFloor=10000&limit=100"
//            urlString = "https://www.hackingwithswift.com/samples/petitions-2.json"
//        }
//        
//        DispatchQueue.global(qos: .userInitiated).async { [weak self] in
//            if let url = URL(string: urlString) {
//                if let data = try? Data(contentsOf: url) {
//                    // we are OK to parse
//                    self?.parse(json: data)
//                    return
//                }
//            }
//            self?.showError()
//        }
        
        performSelector(inBackground: #selector(fetchJSON), with: nil)
        
        title = "Petitons"
    }
    
    @objc func fetchJSON() {
        let urlString: String

        if navigationController?.tabBarItem.tag == 0 {
            // urlString = "https://api.whitehouse.gov/v1/petitions.json?limit=100"
            urlString = "https://www.hackingwithswift.com/samples/petitions-1.json"
        } else {
            // urlString = "https://api.whitehouse.gov/v1/petitions.json?signatureCountFloor=10000&limit=100"
            urlString = "https://www.hackingwithswift.com/samples/petitions-2.json"
        }
        
        if let url = URL(string: urlString) {
            if let data = try? Data(contentsOf: url) {
                // we are OK to parse
                parse(json: data)
                return
            }
        }
        
        performSelector(onMainThread: #selector(showError), with: nil, waitUntilDone: false)
    }
    
    @objc func showCredits() {
        let ac = UIAlertController(title: "Credits", message: "Data is fetched from We The People API of the Whitehouse", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "OK", style: .default))
        present(ac, animated: true)
    }
    
    @objc func filterPetitions() {
        let ac = UIAlertController(title: "Enter Text to filter", message: nil, preferredStyle: .alert)
        ac.addTextField()
        
        let filterAction = UIAlertAction(title: "Filter", style: .default) { [weak self, weak ac] _ in
            guard let text = ac?.textFields?[0].text else {
                return
            }
            self?.filter(byText: text)
        }
        ac.addAction(filterAction)
        present(ac, animated: true)
    }
    
    func filter(byText text: String) {
        filteredPetitions.removeAll(keepingCapacity: true)
        for petition in petitions {
            if petition.title.contains(text) || petition.body.contains(text){
                filteredPetitions.append(petition)
            }
        }
        tableView.reloadData()
    }
    
    @objc func showError() {
//        DispatchQueue.main.async { [weak self] in
//            let ac = UIAlertController(title: "Loadiing error", message: "There was a problem loading the feed; please check your connection and try again.", preferredStyle: .alert)
//            ac.addAction(UIAlertAction(title: "OK", style: .default))
//            self?.present(ac, animated: true)
//        }
        
        let ac = UIAlertController(title: "Loadiing error", message: "There was a problem loading the feed; please check your connection and try again.", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "OK", style: .default))
        present(ac, animated: true)
    }
    
    func parse(json: Data) {
        let decoder = JSONDecoder()
        
        do {
            let jsonPetitions = try decoder.decode(Petitions.self, from: json)
            petitions = jsonPetitions.results
            filteredPetitions = petitions
//            DispatchQueue.main.async { [weak self] in
//                self?.tableView.reloadData()
//            }
            tableView.performSelector(onMainThread: #selector(UITableView.reloadData), with: nil, waitUntilDone: false)
          } catch {
              performSelector(onMainThread: #selector(showError), with: nil, waitUntilDone: false)
          }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredPetitions.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let petition = filteredPetitions[indexPath.row]
        cell.textLabel?.text = petition.title
        cell.detailTextLabel?.text = petition.body
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DetailViewController()
        vc.detailItem = filteredPetitions[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
}

