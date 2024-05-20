//
//  ViewController.swift
//  MilestoneProject-Day74
//
//  Created by Sapna Patwa on 20/05/24.
//


/** Imitating iPhone notes app */

import UIKit

class ViewController: UITableViewController {
    var notes = [Note]()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Notes"
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addNotes))
        navigationItem.rightBarButtonItem?.tintColor = UIColor.systemYellow
        
        if let savedNotes = UserDefaults.standard.object(forKey: "notes") as? Data {
            let decoder = JSONDecoder()
            do {
                notes = try decoder.decode([Note].self, from: savedNotes)
            } catch {
                print("Failed to decode data")
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Notes", for: indexPath)
        let note = notes[indexPath.row]
        let rowTitle = note.text.components(separatedBy: " ").first
        cell.textLabel?.text = (rowTitle?.count ?? 0 > 0) ? rowTitle : "Note"
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Details") as? DetailViewController {
            vc.note = notes[indexPath.row]
            vc.saveClosure = { [weak self] in
                self?.saveData()
                self?.tableView.reloadData()
            }
            vc.deleteClosure = { [weak self] in
                self?.notes.remove(at: indexPath.row)
                self?.saveData()
                self?.tableView.reloadData()
            }
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    @objc func addNotes() {
        notes.append(Note(text: ""))
        tableView.insertRows(at: [IndexPath(row: notes.count-1, section: 0)], with: .automatic)
    }

    func saveData() {
        let json = JSONEncoder()
        if let savedData = try? json.encode(notes) {
            let defaults = UserDefaults.standard
            defaults.setValue(savedData, forKey: "notes")
        } else {
            print("Failed to save data")
        }
    }

}

