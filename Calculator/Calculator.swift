//
//  Calculator.swift
//  Calculator
//
//  Created by Paola Castro on 3/26/20.
//  Copyright © 2020 London App Brewery. All rights reserved.
//

import Foundation

struct Calculator {
    private var number: Double?
    
    private var intermediateCalculation: (n1: Double, operation: String)?
    mutating func setNumber(_ number: Double) {
        self.number = number
    }
    
    mutating func calculateButton(symbol: String) -> Double? {
        if let n = number {
            switch symbol {
            case "+/-":
                return n * -1
            case "AC":
                return 0
            case "%" :
                return n / 100
            case "=" :
                return performCalculation(n2: n)
            default:
                intermediateCalculation = (n1: n, operation: symbol)
            }
        }
        return nil
    }
    
    private func performCalculation(n2: Double) -> Double? {
        if let n1 = intermediateCalculation?.n1, let operation = intermediateCalculation?.operation {
            switch operation {
            case "+":
                return n1 + n2
            case "-":
                return n1 - n2
            case "×":
                return n1 * n2
            case "÷":
                return n1 / n2
            default:
                fatalError("The operation chosen is not supported")
            }
        }
        return nil
    }
}
