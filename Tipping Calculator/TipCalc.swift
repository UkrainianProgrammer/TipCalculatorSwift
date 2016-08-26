//
//  TipCalc.swift
//  Tipping Calculator
//
//  Created by Oleksandr Sofishchenko on 8/25/16.
//  Copyright © 2016 Oleksandr Sofishchenko. All rights reserved.
//

import Foundation

class TipCalc{
    
    var tipAmount:Float = 0
    var amountBeforeTax:Float = 0
    var tipPercentage:Float = 0
    var totalAmount:Float = 0
    
    var numberOfPeoplePaying:Float = 0
    var individualPayment:Float = 0
    
    init(amountBeforeTax:Float, tipPercentage:Float, numberOfPeoplePaying:Float){
        self.amountBeforeTax = amountBeforeTax
        self.tipPercentage = tipPercentage
        self.numberOfPeoplePaying = numberOfPeoplePaying
    }
    
    func calculateTip(){
        tipAmount = amountBeforeTax * tipPercentage
        totalAmount = tipAmount + amountBeforeTax
        individualPayment = (amountBeforeTax / numberOfPeoplePaying) + (tipAmount / numberOfPeoplePaying)
    }
    
}