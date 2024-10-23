//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var zeroPrcView: UIButton!
    @IBOutlet weak var tenPrcView: UIButton!
    @IBOutlet weak var twentyPrcView: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func percentagPressed(_ sender: UIButton) {
        print("button pressed \(sender.titleLabel!.text!)")
    }
    
}

