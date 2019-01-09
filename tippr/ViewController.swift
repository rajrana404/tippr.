//
//  ViewController.swift
//  tippr
//
//  Created by Raj Rana on 1/7/19.
//  Copyright © 2019 Raj Rana. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var splitLabel: UILabel!
    @IBOutlet weak var splitStepper: UIStepper!
    @IBOutlet weak var eachSplitLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.splitLabel.text = "\(Int(self.splitStepper.value))"
    }

    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    
    @IBAction func splitter(_ sender: UIStepper) {
        splitLabel.text = String(Int(sender.value))
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        let tipPercentages = [0.15, 0.18, 0.2]
        let bill = Double(billField.text!) ?? 0
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        let split = Double(splitStepper.value)
        let each = total / split
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        eachSplitLabel.text = String(format: "$%.2f", each)
        
    }
    
    
}

