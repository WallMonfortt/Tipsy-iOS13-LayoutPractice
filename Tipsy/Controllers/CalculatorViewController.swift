//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var zeroPrcView: UIButton!
    @IBOutlet weak var tenPrcView: UIButton!
    @IBOutlet weak var twentyPrcView: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var btnSelected: String?
    var people: Int?
    var totalBill: Float?
    var totalTip: Float?

    @IBAction func percentagPressed(_ sender: UIButton) {
        print("button pressed \(sender.titleLabel!.text!)")
        sender.isSelected ? nil : sender.isSelected.toggle()
        
        btnSelected = sender.titleLabel!.text!
        
        unselectBtns()
    }
    
    @IBAction func getTotalBill(_ sender: UITextField) {
        print(sender.text!)
        totalBill = Float(sender.text!)
    }

    func unselectBtns() {
        let btns: [UIButton] = [zeroPrcView, tenPrcView, twentyPrcView]
        for btn in btns {
            if btn.titleLabel!.text! != btnSelected{
                btn.isSelected = false
            }
        }
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(Int(sender.value).description)
        people = Int(sender.value)
    }

    @IBAction func calculatePressed(_ sender: UIButton) {
        if btnSelected == nil {
            btnSelected = "10%"
        }
        if people == nil {
            people = 2
        }
        let index = btnSelected!.firstIndex(of: "%") ?? btnSelected!.endIndex
        let percentageString = btnSelected![..<index]
        let percentage = Double(percentageString)! / 100
        print(percentage)
        print("people: \(people!)")
        print(totalBill!)
        
        calculateAmount(Float(people!), percentage, totalBill!)
        
        self.performSegue(withIdentifier: "goToResult", sender: self)

    }
    
    func calculateAmount(_ people: Float, _ percentage: Double, _ totalAmount: Float) {
        let amount = (totalAmount + (totalAmount * Float(percentage)));
        totalTip = amount / Float(people)
        print("the final amount is: \(String(describing: totalTip))")
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.people = people
            destinationVC.percentage = btnSelected
            destinationVC.tip = String(totalTip!)
        }
    }
    
}

