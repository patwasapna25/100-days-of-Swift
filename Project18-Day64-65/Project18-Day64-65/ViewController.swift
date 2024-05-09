//
//  ViewController.swift
//  Project18-Day64-65
//
//  Created by Sapna Patwa on 09/05/24.
//


/**
 In this project we’ll be looking at several different debugging techniques, all of which are useful. Arranged them easy to hard, so you can get started immediately and work your way forward as your skills improve.
 **/

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(1, 2, 3, 4, 5, separator: "-")
        print("Some message", terminator: "")
        
        /**
         assert()
         These are debug-only checks that will force your app to crash if a specific condition isn't true.

         On the surface, that sounds terrible: why would you want your app to crash? There are two reasons:
         sometimes making your app crash is the Least Bad Option: if something has gone catastrophically wrong – if some fundamentally important file is not where it should be – then it may be the case that continuing your app will cause irreparable harm to user data, in which case crashing, while a bad result, is better than losing data.
         these assertion crashes only happen while you’re debugging. When you build a release version of your app – i.e., when you ship your app to the App Store – Xcode automatically disables your assertions so they won’t reach your users.
         */
        assert(1 == 1, "Maths failure!") // check will pass
        assert(1 == 2, "Maths failure!") // check will fail and app will crash
    }


}

