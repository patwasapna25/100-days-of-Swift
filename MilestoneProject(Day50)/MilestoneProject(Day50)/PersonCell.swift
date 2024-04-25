//
//  PersonCell.swift
//  MilestoneProject(Day50)
//
//  Created by Sapna Patwa on 25/04/24.
//

import Foundation
import UIKit


class PersonCell: UITableViewCell {
    var image: UIImageView?
    var caption: UILabel?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        let imageView = UIImageView(frame: .zero)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(imageView)
        imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: -10).isActive = true
        imageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        image = imageView
        
        let caption = UILabel(frame: .zero)
        caption.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(caption)
        caption.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 20).isActive = true
        caption.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        self.caption = caption
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
