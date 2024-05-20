//
//  DetailViewController.swift
//  MilestoneProject-Day74
//
//  Created by Sapna Patwa on 20/05/24.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet var textView: UITextView!
    var deleteClosure: (()->())?
    var saveClosure: (()->())?
    var note: Note?

    override func viewDidLoad() {
        super.viewDidLoad()
        title = note?.text.components(separatedBy: " ").first
        
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self, selector: #selector(adjustKeyboard), name: UIResponder.keyboardWillHideNotification, object: nil)
        notificationCenter.addObserver(self, selector: #selector(adjustKeyboard), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(doneTapped))
        navigationController?.navigationBar.tintColor = UIColor.systemYellow
        
        let delete = UIBarButtonItem(title: "Delete", style: .plain, target: self, action: #selector(deleteNote))
        let spacer = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let compose = UIBarButtonItem(barButtonSystemItem: .compose, target: self, action: #selector(composeNote))
        toolbarItems = [delete, spacer, compose]
        navigationController?.isToolbarHidden = false
        navigationController?.toolbar.tintColor = UIColor.systemYellow
        
        textView.text = note?.text
    }
    
    @objc func adjustKeyboard(notification: Notification) {
        guard let keyboardValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else {
            return
        }
        
        let keyboardScreenEndFrame = keyboardValue.cgRectValue
        let keyboardViewFrame = view.convert(keyboardScreenEndFrame, from: view.window)
        
        if notification.name == UIResponder.keyboardWillHideNotification {
            textView.contentInset = .zero
        } else {
            textView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: keyboardViewFrame.height - view.safeAreaInsets.bottom, right: 0)
        }
        
        textView.scrollIndicatorInsets = textView.contentInset
        
        let selectedRange = textView.selectedRange
        textView.scrollRangeToVisible(selectedRange)
    }
    
    @objc func deleteNote() {
        if let deleteClosure {
            deleteClosure()
        }
        navigationController?.popViewController(animated: true)
    }
    
    @objc func composeNote() {
        
    }
    
    @objc func doneTapped() {
        if let saveClosure {
            note?.text = textView.text
            saveClosure()
        }
        navigationController?.popViewController(animated: true)
    }
}
