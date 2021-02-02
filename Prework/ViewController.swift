//
//  ViewController.swift
//  Prework
//
//  Created by Chloe Mack on 2/2/21.
//

import UIKit

class ViewController: UIViewController {

    
    

    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var customTipTextField: UITextField!
    @IBOutlet weak var updateButton: UIButton!
    @IBOutlet weak var totalLabel: UILabel!
    
    struct defaultsKeys {
        static let keyOne = "billKey"
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func calculateTip(_ sender: Any) {
        
        let formatter = NumberFormatter()
        formatter.usesGroupingSeparator = true
        formatter.numberStyle = .currency
        formatter.locale = Locale.current
        
        //Get bill amount
        let bill = Double(billAmountTextField.text!) ?? 0
        let tipPercentages = [0.15, 0.18, 0.2]
        var tip = 0.0
        var total = 0.0;
        //get total tip
        if tipControl.selectedSegmentIndex != 3{
            tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
            total = bill + tip
        }else if customTipTextField.text == "" && tipControl.selectedSegmentIndex == 3 {
            total = bill
        }else{
            let customTipText = Double(customTipTextField.text!) ?? 0
            tip = (customTipText/100.0) * bill
            
            total = tip + bill
        }
        
        
        
        //Update tip amount label
        let tipString = formatter.string(from: NSNumber(value: tip))!
        tipAmountLabel.text = tipString
        
        //Update total amount
        let totalString = formatter.string(from: NSNumber(value: total))!
        totalLabel.text = totalString
    }
    
    @IBAction func updateCustom(_ sender: UIButton) {
        calculateTip("")
    }
    
    
}

