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
    var split:Int = 2
    
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    @IBAction func billTextChanged(_ sender: UITextField) {
        updateBill()
    }
    
    @IBAction func tipChanged(_ sender: UIButton) {
        billTextField.endEditing(true)
        
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        
        sender.isSelected = true
        tip = firstNumber(sender.currentTitle) ?? tip
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        billTextField.endEditing(true)
        split = Int(sender.value)
        splitNumberLabel.text = String(split)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        billTextField.endEditing(true)
        updateBill()
        print((tip + 1.0) * bill / Double(split))
    }
    
    private func updateBill() {
        bill = firstNumber(billTextField.text) ?? bill
    }

    private func firstNumber(_ str:String?) -> Double? {
        guard let s = str else { return nil }
        let r = NSRange(s.startIndex ..< s.endIndex, in: s)
        guard let match = regex.firstMatch(in: s, range: r) else { return nil }
        
        let negativeRange = match.range(withName: "negative")
        let numberRange = match.range(withName: "number")
        let percentRange = match.range(withName: "percent")
        
        guard let range = Range(numberRange, in: s) else { return nil }
        guard var number = Double(s[range]) else { return nil }
        if(negativeRange.length > 0) {
            number *= -1.0
        }
        if(percentRange.length > 0) {
            number *= 0.01
        }
        return number
    }
    
    private let regex = try! NSRegularExpression(pattern: PATTERN)
    
    private static let PATTERN =
        #"(?<negative>[-]?+)\s*"# +
        #"(?<number>\d++[.]?+\d*+|[.]\d++)"# +
        #"\s*(?<percent>[%]?+)"#
}

