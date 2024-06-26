//
//  ViewController.swift
//  Project2(Day19-21)
//
//  Created by Sapna Patwa on 27/03/24.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    
    var countries = [String]()
    var score = 0
    var count = 0
    var correctAnswer = 0
    var highScore = 0
    var highScoreFlagShown = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor
        askQuestion(action: nil)
        
        if let savedScore = UserDefaults.standard.data(forKey: "score") {
            let jsonDecoder = JSONDecoder()
            
            do {
                highScore = try jsonDecoder.decode(Int.self, from: savedScore)
            } catch {
                print("Failed to decode data")
            }
        }
    }
    
    func askQuestion(action: UIAlertAction!) {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        count += 1;
        
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        
        title = "\(countries[correctAnswer].uppercased()) Score: \(score)"
        
        if count == 10 {
            let ac = UIAlertController(title: "Final score", message: "Your final score is \(score).", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "Start New Game", style: .default, handler: { [weak self] _ in 
                self?.score = 0
                self?.count = 0
                self?.askQuestion(action: nil)
                self?.save()
            }))
            present(ac, animated: true)
        }
    }

    @IBAction func buttonTapped(_ sender: UIButton) {
        var title: String
        
        if sender.tag == correctAnswer {
            title = "Correct"
            score += 1
            if (score > highScore) {
                highScore = score
                if !highScoreFlagShown {
                    let ac = UIAlertController(title: "High Score!!", message: "Your high score is \(score).", preferredStyle: .alert)
                    ac.addAction(UIAlertAction(title: "Continue", style: .default))
                    present(ac, animated: true)
                    highScoreFlagShown = true
                }
            }
        } else {
            title = "Wrong! That’s the flag of \(countries[sender.tag])"
            score -= 1
        }
        
        let ac = UIAlertController(title: title, message: "Your score is \(score).", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
        present(ac, animated: true)
    }
    
    // challenge for Day49
    func save() {
        let jsonEncoder = JSONEncoder()
        if let savedData = try? jsonEncoder.encode(highScore) {
            UserDefaults.standard.setValue(savedData, forKey: "score")
        } else {
            print("Failed to encode data")
        }
    }
}

