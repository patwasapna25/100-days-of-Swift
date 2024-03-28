//
//  DetailViewController.swift
//  MilestoneProject(Day23)
//
//  Created by Sapna Patwa on 29/03/24.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    var selectedImage: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let image = selectedImage {
            imageView.image = UIImage(named: image)
        }
        // Do any additional setup after loading the view.
    }

}
