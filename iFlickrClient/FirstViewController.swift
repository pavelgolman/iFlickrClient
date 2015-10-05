//
//  FirstViewController.swift
//  iFlickrClient
//
//  Created by Pavel on 10/5/15.
//  Copyright © 2015 Pavel. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let fk = FlickrKit.sharedFlickrKit()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

