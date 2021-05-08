//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    var bill:Double = 0.0
    var tip:Double = 0.1
    var split = 2
    
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    @IBAction func billTextChanged(_ sender: UITextField) {
        updateBill()
    }
    
    func updateBill() {
        let billText = firstNumericSubstring(billTextField.text)
        if(billText?.isEmpty ?? true) { return }
        bill = Double(billText!) ?? bill
    }

    @IBAction func tipChanged(_ sender: UIButton) {
        billTextField.endEditing(true)
        
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        
        sender.isSelected = true
        
        let tipText = firstNumericSubstring(sender.currentTitle)
        if(tipText?.isEmpty ?? true) { return }
        tip = Double(tipText!) ?? tip
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
    
    private func firstNumericSubstring(_ s:String?) -> String? {
        let r = s?.range(of:"([-]\\s*+)?+\\d*+([.]\\d{1,8}+)?+",options:.regularExpression)
        if(r?.isEmpty ?? true) { return nil }
        let substr = s![r!]
        return substr.isEmpty ? nil : String(substr)
    }
    
}

