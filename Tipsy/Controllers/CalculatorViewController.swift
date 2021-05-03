//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    let NUM_PATTERN = try? NSRegularExpression(pattern: "(?:[-]\\s*+)?+\\d*+(?:[.]\\d++)?+")
    var bill = 0.0
    var tip = 0.1
    var split = 2
    
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    func updateBill() {
        let billText = billTextField.text
        if(billText?.isEmpty ?? true) { return }
        bill = Double(billText!) ?? bill
    }
    
    @IBAction func billTextChanged(_ sender: UITextField) {
        updateBill()
    }
    
    @IBAction func tipChanged(_ sender: UIButton) {
        billTextField.endEditing(true)
        
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        
        sender.isSelected = true
        
        var str = sender.currentTitle ?? "0"
        var range = NSRange(location: 0, length: str.utf16.count)
        range = NUM_PATTERN?.rangeOfFirstMatch(in: str, range: range) ?? range
        let match = String(str[Range(range, in: str)!])
        if(match.utf16.count > 0){ str = match }
        tip = Double(str) ?? tip
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        billTextField.endEditing(true)
        split = Int(sender.value)
        splitNumberLabel.text = String(split)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        billTextField.endEditing(true)
        updateBill()
    }

}

