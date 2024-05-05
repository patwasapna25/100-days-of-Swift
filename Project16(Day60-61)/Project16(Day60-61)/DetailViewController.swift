//
//  DetailViewController.swift
//  Project16(Day60-61)
//
//  Created by Sapna Patwa on 06/05/24.
//

import UIKit
import WebKit

class DetailViewController: UIViewController {
    @IBOutlet weak var webView: WKWebView!
    var capitalCity: Capital?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let capitalCity, let url = URL(string: capitalCity.wikiLink) {
            title = capitalCity.title
            let request = URLRequest(url: url)
            self.webView.load(request)
        }
        
    }

}
