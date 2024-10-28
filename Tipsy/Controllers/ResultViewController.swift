//
//  ResultViewController.swift
//  Tipsy
//
//  Created by Jose Gualberto Monfortte Flores on 24/10/24.
//  Copyright © 2024 The App Brewery. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    var percentage: String?
    var people: Int?
    var tip: String?

    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        totalLabel.text = String(tip!)
        settingsLabel.text = "\(people!) people, \(percentage!) tip"

        // Do any additional setup after loading the view.
    }
    

    @IBAction func recalculatePressed(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
}
