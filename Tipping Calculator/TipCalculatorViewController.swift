//
//  TipCalculatorViewController.swift
//  Tipping Calculator
//
//  Created by Oleksandr Sofishchenko on 8/25/16.
//  Copyright © 2016 Oleksandr Sofishchenko. All rights reserved.
//

import UIKit

class TipCalculatorViewController: UIViewController, UITextFieldDelegate {
    
    //MARK:- IBOutlets

    @IBOutlet weak var inputBeforeTaxTextField: UITextField!
    @IBOutlet weak var tipPercentageLabel: UILabel!
    @IBOutlet weak var tipPercentageSlider: UISlider!
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBOutlet weak var splitLabel: UILabel!
    @IBOutlet weak var splitSlider: UISlider!
    @IBOutlet weak var splitResultLabel: UILabel!
    
    //MARK:- Properties
    var tipCalc = TipCalc(amountBeforeTax: 0.0, tipPercentage: 0.0, numberOfPeoplePaying: 1)
    
    //MARK:- View Controller lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //inputBeforeTaxTextField.text = String(format: "%0.2f", tipCalc.amountBeforeTax)
    }
    
    func calcTip(){
        tipCalc.tipPercentage = Float(tipPercentageSlider.value)
        tipCalc.amountBeforeTax = (inputBeforeTaxTextField.text! as NSString).floatValue
        tipCalc.numberOfPeoplePaying = Float(splitSlider.value)
        tipCalc.calculateTip()
        updateUI()
    }
    
    func updateUI(){
        
        resultLabel.text = String(format: "Total: $%0.2f, Tip: $%0.2f", arguments: [tipCalc.totalAmount, tipCalc.tipAmount])
        splitResultLabel.text = String(format: "Each: $%0.2f", arguments: [tipCalc.individualPayment])
    }
    
    //MARK:- UIControl Events
    
    @IBAction func inputBeforeTaxTextFieldChanged(sender: AnyObject) {
        calcTip()
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        if textField == inputBeforeTaxTextField {
            textField.resignFirstResponder()
            calcTip()
        }
        return true
    }

    @IBAction func tipPercentageSliderValueChanged(sender: AnyObject) {
        tipPercentageLabel.text! = String(format: "Tip: %02d%%", arguments: [Int(tipPercentageSlider.value * 100)])
        calcTip()
    }
    
    @IBAction func splitPercentageSliderValueChanged(sender: AnyObject) {
        splitLabel.text! = String(format: "Split: %02d", arguments: [Int(splitSlider.value)])
        calcTip()
    }
    
}
