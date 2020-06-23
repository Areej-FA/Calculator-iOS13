//
//  CalculatorLogic.swift
//  Calculator
//
//  Created by Areej on 6/23/20.
//  Copyright © 2020 London App Brewery. All rights reserved.
//

import Foundation

struct CalculatorLogic {
    
    private var number : Double?
    
    private var intermediateCalcultion: (n1: Double, calcMethod: String)?
    
    mutating func setNumber(_ number: Double){
        self.number = number
        print(number)
    }
    
    mutating func calculate(symbol: String) -> Double? {
        if let n = number{
            switch symbol {
            case "+/-":
                return n * -1
            case "%":
                return n / 100
            case "AC":
                return 0
            case "=":
                return performTwoNumberCalculation(n2: n)
            default:
                intermediateCalcultion = (n1: n ,calcMethod: symbol)
            }
        }
        
        return nil
    }
    
    private func performTwoNumberCalculation(n2: Double) -> Double? {
        
        if let n1 = intermediateCalcultion?.n1,
            let operation = intermediateCalcultion?.calcMethod {
            
            switch operation {
            case "+":
                return n1 + n2
            case "-":
                return n1 - n2
            case "÷":
                return n1 / n2
            case "×":
                return n1 * n2
            default:
                fatalError("The operation passed in dose not match any of the cases")
            }
        }
               return nil
    }
    
}
