//
//  CollectionViewCell.swift
//  MilestoneProject-Day99
//
//  Created by Sapna Patwa on 22/06/24.
//

/**
 A memory pairs game that has players find pairs of cards – it’s sometimes called Concentration, Pelmanism, or Pairs
 */


import UIKit

class CollectionViewCell: UICollectionViewCell {
    var frontView: UIView!
    var backView: UIView!
    var frontLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.layer.cornerRadius = 10
        self.clipsToBounds = true
        
        frontView = UIView(frame: .zero)
        frontView.translatesAutoresizingMaskIntoConstraints = false
        frontView.backgroundColor = .white
        frontView.layer.borderWidth = 1
        frontView.layer.borderColor = UIColor.black.cgColor
        frontView.layer.cornerRadius = 20
        self.contentView.addSubview(frontView)
        frontView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        frontView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        frontView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        frontView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        
        frontLabel = UILabel(frame: .zero)
        frontLabel.translatesAutoresizingMaskIntoConstraints = false
        frontView.addSubview(frontLabel)
        frontLabel.centerXAnchor.constraint(equalTo: frontView.centerXAnchor).isActive = true
        frontLabel.centerYAnchor.constraint(equalTo: frontView.centerYAnchor).isActive = true
        
        backView = UIView(frame: .zero)
        backView.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(backView)
        backView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        backView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        backView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        backView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        backView.backgroundColor = .gray
        
        let imageView = UIImageView(image: UIImage(named: "card"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .white
        backView.addSubview(imageView)
        imageView.leadingAnchor.constraint(equalTo: backView.leadingAnchor).isActive = true
        imageView.trailingAnchor.constraint(equalTo: backView.trailingAnchor).isActive = true
        imageView.topAnchor.constraint(equalTo: backView.topAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: backView.bottomAnchor).isActive = true
        
        
        frontView.isHidden = true
    }
    
    @objc func flip(fromLeft: Bool = false) {
        let transitionOptions: UIView.AnimationOptions = [fromLeft ? .transitionFlipFromLeft : .transitionFlipFromRight, .showHideTransitionViews]
        
        UIView.transition(with: frontView, duration: 1, options: transitionOptions) {
            self.frontView.isHidden = !self.frontView.isHidden
        }
        
        UIView.transition(with: backView, duration: 1, options: transitionOptions) {
            self.backView.isHidden = !self.backView.isHidden
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
