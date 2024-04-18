//
//  ViewController.swift
//  MilestoneProject(Day41)
//
//  Created by Sapna Patwa on 15/04/24.
//

import UIKit

class ViewController: UIViewController {
    let word = "RHYTHM"
    var textLabel: UILabel!
    var livesLabel: UILabel!
    var enterButton: UIButton!
    var usedLetters = [String]()
    var lives = 7 {
        didSet {
            livesLabel.text = "Lives: \(lives)"
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        livesLabel = UILabel()
        livesLabel.text = "Lives: 7"
        livesLabel.translatesAutoresizingMaskIntoConstraints = false
        livesLabel.font = UIFont.systemFont(ofSize: 20)
        view.addSubview(livesLabel)
        
        textLabel = UILabel()
        textLabel.text = "??????"
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        textLabel.textAlignment = .center
        textLabel.font = UIFont.systemFont(ofSize: 36)
        view.addSubview(textLabel)
        
        enterButton = UIButton(type: .custom)
        enterButton.translatesAutoresizingMaskIntoConstraints = false
        enterButton.setTitle("Enter Letter", for: .normal)
        enterButton.setTitleColor(UIColor.white, for: .normal)
        enterButton.backgroundColor = UIColor.gray
        enterButton.layer.cornerRadius = 5
        enterButton.addTarget(self, action: #selector(processLetter), for: .touchUpInside)
        view.addSubview(enterButton)
        
        
        NSLayoutConstraint.activate([
            livesLabel.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
            livesLabel.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            
            textLabel.topAnchor.constraint(equalTo: livesLabel.bottomAnchor, constant: 50),
            textLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textLabel.widthAnchor.constraint(equalToConstant: 150),
            textLabel.heightAnchor.constraint(equalToConstant: 100),
            
            enterButton.centerYAnchor.constraint(equalTo: view.layoutMarginsGuide.centerYAnchor),
            enterButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            enterButton.widthAnchor.constraint(equalToConstant: 120),
            enterButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }

    
    @objc func processLetter() {
        let ac = UIAlertController(title: "Enter Letter", message: nil, preferredStyle: .alert)
        ac.addTextField()
        
        let submitAction = UIAlertAction(title: "Submit", style: .default) { [weak self] _ in
            if let answer = ac.textFields?[0].text {
                self?.processAnswer(answer.uppercased())
            }
        }
        ac.addAction(submitAction)
        present(ac, animated: true)
    }
    
    func processAnswer(_ letter: String) {
        if letter.count == 1 && word.contains(letter) {
            usedLetters.append(letter)
            var newWord = "" 
            for l in word {
                if(usedLetters.contains(String(l))) {
                    newWord.append(String(l))
                } else {
                    newWord.append("?")
                }
            }
            textLabel.text = newWord
            
            if(!newWord.contains("?")) {
                let ac = UIAlertController(title: "Congrats!! You won.", message: nil, preferredStyle: .alert)
                ac.addAction(UIAlertAction(title: "OK", style: .default))
                present(ac, animated: true)
            }
        } else {
            lives -= 1;
            if(lives <= 0) {
                let ac = UIAlertController(title: "Opps!! You are dead", message: "Sorry, no more lives left", preferredStyle: .alert)
                ac.addAction(UIAlertAction(title: "OK", style: .default))
                present(ac, animated: true)
            }
        }
    }

}

