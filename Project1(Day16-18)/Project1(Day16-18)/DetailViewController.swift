//
//  DetailViewController.swift
//  Project1(Day16-18)
//
//  Created by Sapna Patwa on 27/03/24.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    var selectedimage: String?
    var selectedImageIndex: Int?
    static var totalImageCount: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = selectedimage
        navigationItem.largeTitleDisplayMode = .never

        if let imageToLoad = selectedimage {
            imageView.image = UIImage(named: imageToLoad)
        }
        
        if let index  = selectedImageIndex, let totlaCount = DetailViewController.totalImageCount {
            title = "Picture \(index+1) of \(totlaCount)"
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
