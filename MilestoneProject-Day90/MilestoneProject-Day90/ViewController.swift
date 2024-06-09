//
//  ViewController.swift
//  MilestoneProject-Day90
//
//  Created by Sapna Patwa on 09/06/24.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    @IBOutlet var imageView: UIImageView!
    var topText: String?
    var bottomText: String?
    var image: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Create Meme"
//        imageView.backgroundColor = UIColor.lightGray
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(doneTapped))
    }

    @IBAction func importImage(_ sender: Any) {
        let imagePicker = UIImagePickerController()
        imagePicker.allowsEditing = true
        imagePicker.delegate = self
        present(imagePicker, animated: true)
    }
    
    @IBAction func setTopText(_ sender: Any) {
        getText(isTop: true)
    }
    
    @IBAction func setBottomText(_ sender: Any) {
        getText(isTop: false)
    }
    
    func getText(isTop: Bool) {
        let ac = UIAlertController(title: "Enter Top Text", message: nil, preferredStyle: .alert)
        ac.addTextField()
        let action = UIAlertAction(title: "OK", style: .default, handler: { [weak self] _ in 
            let textField = ac.textFields?.first
            if isTop {
                self?.topText = textField?.text
            } else {
                self?.bottomText = textField?.text
            }
        })
        ac.addAction(action)
        present(ac, animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[.editedImage] as? UIImage else { return }
        dismiss(animated: true)
        self.image = image
    }
    
    @objc func doneTapped() {
        let rendered = UIGraphicsImageRenderer(size: CGSize(width: 363, height: 584))
        
        let image = rendered.image(actions: { ctx in
            let rectangle = CGRect(x: 0, y: 0, width: 363, height: 584)
            ctx.cgContext.setStrokeColor(UIColor.black.cgColor)
            ctx.cgContext.setLineWidth(2)
            ctx.cgContext.addRect(rectangle)
            ctx.cgContext.drawPath(using: .stroke)
            
            let paraghraphStyle = NSMutableParagraphStyle()
            paraghraphStyle.alignment = .center
            
            let attrs: [NSAttributedString.Key: Any] = [
                .font: UIFont.systemFont(ofSize: 20),
                .strokeWidth: 10,
                .foregroundColor: UIColor.gray,
                .paragraphStyle: paraghraphStyle
            ]
            
            if let topText {
                let topAttributedString = NSAttributedString(string: topText, attributes: attrs)
                topAttributedString.draw(with: CGRect(x: 20, y: 10, width: 300, height: 30), options: .usesLineFragmentOrigin, context: nil)
            }
            
            self.image?.draw(in: CGRect(x: 20, y: 50, width: 323, height: 480))
            
            if let bottomText {
                let bottomAttributedString = NSAttributedString(string: bottomText, attributes: attrs)
                bottomAttributedString.draw(with: CGRect(x: 20, y: 550, width: 300, height: 30), options: .usesLineFragmentOrigin, context: nil)
            }

        })
        
        imageView.image = image
    }
}

