//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Spencer Graff on 11/24/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    
    var totalPerPerson = ""
    var numberOfPeople = ""
    var tipPercentage = ""

    @IBOutlet weak var totalLabel: UILabel?
    @IBOutlet weak var settingsLabel: UILabel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        totalLabel?.text = totalPerPerson
        settingsLabel?.text =
            "Split between \(numberOfPeople) people" +
            ", with \(tipPercentage)% tip."
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }

}
