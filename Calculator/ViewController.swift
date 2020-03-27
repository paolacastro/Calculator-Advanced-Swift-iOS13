//
//  ViewController.swift
//  Calculator
//
//  Created by Angela Yu on 10/09/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    private var isFinishedTypingNumber: Bool = true
    
    var calculator = Calculator()
    
    @IBOutlet weak var displayLabel: UILabel!
    
    private var displayValue: Double {
        get {
            guard let number = Double(displayLabel.text!) else {
                fatalError("Cannot covert an non-numeric string to Double")
            }
            return number
        }
        set {
            let isInt = floor(newValue) == newValue
            
            if !isInt {
                displayLabel.text = String(newValue)
            } else {
                displayLabel.text = String(Int(newValue))
            }
        }
    }
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        
        isFinishedTypingNumber = true
        
        if let symbol = sender.currentTitle{
            calculator.setNumber(displayValue)
            if let result = calculator.calculateButton(symbol: symbol) {
                displayValue = result
            }
            
        }
        isFinishedTypingNumber = true
    
    }

    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        
        if let numValue = sender.currentTitle {
            if isFinishedTypingNumber {
                displayLabel.text = numValue
                isFinishedTypingNumber = false
            } else {
                if numValue == "." {
                    let isInt = floor(displayValue) == displayValue
                    
                    if !isInt {
                        return
                    }
                }
                displayLabel.text = displayLabel.text! + numValue
            }
        }
    
    }

}

