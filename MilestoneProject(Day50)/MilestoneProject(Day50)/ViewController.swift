//
//  ViewController.swift
//  MilestoneProject(Day50)
//
//  Created by Sapna Patwa on 25/04/24.
//

import UIKit

class ViewController: UITableViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    var people = [Person]()

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addNewPerson))
        
        tableView.register(PersonCell.self, forCellReuseIdentifier: "Person")
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        people.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let person = people[indexPath.row]
        var cell = tableView.dequeueReusableCell(withIdentifier: "Person", for: indexPath) as? PersonCell
        if cell == nil {
            cell = PersonCell(style: .default, reuseIdentifier: "Person")
        }
        let path = getDocumentsDirectory().appendingPathComponent(person.imageName)
        cell?.caption?.text = person.name
        cell?.image?.image = UIImage(contentsOfFile: path.path)
        cell?.image?.layer.borderColor = UIColor(white: 0, alpha: 0.3).cgColor
        cell?.image?.layer.borderWidth = 2
        cell?.image?.layer.cornerRadius = 3
        return cell ?? UITableViewCell()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let person = people[indexPath.row]
        let ac = UIAlertController(title: "Add Image Name", message: nil, preferredStyle: .alert)
        ac.addTextField()
        ac.addAction(UIAlertAction(title: "Done", style: .default) { [weak ac, weak self] _ in
            guard let newName = ac?.textFields?[0].text else { return }
            person.name = newName
            self?.tableView.reloadData()
        })
        
        present(ac, animated: true)
    }
    
    @objc func addNewPerson() {
        let picker = UIImagePickerController()
        picker.allowsEditing = true
        picker.delegate = self
        present(picker, animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        
        guard let image = info[.editedImage] as? UIImage else {
            return
        }
        
        let imageName = UUID().uuidString
        let imagePath = getDocumentsDirectory().appendingPathComponent(imageName) 
        
        if let jpegData = image.jpegData(compressionQuality: 0.8) {
            try? jpegData.write(to: imagePath)
        } 
        
        let person = Person(name: "Unknown", imageName: imageName)
        people.append(person)
        tableView.reloadData()
        dismiss(animated: true)
    }
    
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
}

