//
//  ViewController.swift
//  MilestoneProject-Day99
//
//  Created by Sapna Patwa on 22/06/24.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    let matches = ["Nepal": "Kathmandu", "Italy": "Rome", "England": "London", "Germany": "Berlin", "India" : "New Delhi", "Ireland": "Dublin", "Japan": "Tokyo", "Greece": "Athens", "Estonia": "Tallinn", "Russia": "Moscow", "South Korea": "Seoul", "Egypt": "Cairo", "Bermuda": "Hamilton", "Maldives": "Malé", "China":"Beijing", "Qatar": "Doha", "Turkey": "Ankara", "Singapore": "Singapore"]

    var list = [String]()
    var cards: [CollectionViewCell?] = [CollectionViewCell]()
    var cardsMatched = 0 {
        didSet {
            if cardsMatched == matches.count {
                let ac = UIAlertController(title: "You Did it!!!", message: nil, preferredStyle: .alert)
                ac.addAction(UIAlertAction(title: "Cancle", style: .cancel))
                ac.addAction(UIAlertAction(title: "Play Again", style: .default, handler: {[weak self]  _ in 
                    self?.loadlevel()
                }))
                present(ac, animated: true)
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "bg")
        backgroundImage.contentMode = .scaleAspectFill
        self.view.insertSubview(backgroundImage, at: 0)
        
        for (key, value) in matches {
            list.append(key)
            list.append(value)
        }
        
        DispatchQueue.main.async {
            let ac = UIAlertController(title: "Start Game!", message: "Match Countries with Capitals", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "Let's Go!", style: .cancel))
            self.present(ac, animated: true)
        }
        
        loadlevel()
    }
    
    func loadlevel() {
        list.shuffle()

        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.itemSize = CGSize(width: 100, height: 100)
        flowLayout.minimumLineSpacing = 20
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(collectionView)
        collectionView.backgroundColor = .clear
        collectionView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        collectionView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        collectionView.widthAnchor.constraint(equalToConstant: 740).isActive = true
        collectionView.heightAnchor.constraint(equalToConstant: 740).isActive = true
        collectionView.contentInset = UIEdgeInsets(top: 15, left: 20, bottom: 15, right: 20)
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 36
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as? CollectionViewCell
        cell?.frontLabel.text = list[indexPath.row]
        return cell ?? UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as? CollectionViewCell
        cell?.flip()
        cards.append(cell)
        
        if cards.count == 2 {
            let string1 = cards[0]?.frontLabel.text
            let string2 = cards[1]?.frontLabel.text
            let cardsCopy = cards
            if let string1, let string2, matches[string1] == string2 || matches[string2] == string1 {
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    cardsCopy[0]?.isHidden = true
                    cardsCopy[1]?.isHidden = true
                }
                cardsMatched += 1
            } else if string1 != string2 {
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    cardsCopy[0]?.flip(fromLeft: true)
                    cardsCopy[1]?.flip(fromLeft: true)
                }
                
            }
            cards.removeAll(keepingCapacity: true)
        }
    }
}

