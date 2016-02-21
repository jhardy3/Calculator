//
//  CalculatorController.swift
//  Calculator
//
//  Created by Jake Hardy on 2/19/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation
import UIKit



class CalculatorController {
    
    static private var stack = [Int]()
    
    static private var number = ""
    static private var operations = ""
    
    
    
    static func number(number: String) {
        self.number += number
        
        
    }
    
    static func operations(operation: String) {
        
        if operations.isEmpty {
            operations = operation
        } else {
            return
        }
        
    }
    
    static func enter() -> String? {
        if (stack.count < 2) && operations.isEmpty && !number.isEmpty {
            guard let number = Int(self.number) else { return nil }
            stack.append(number)
            self.number = ""
            return nil
        }
        
        if stack.count > 2  {
            stack.removeAll()
            self.number = ""
            return nil
        }
        
        if stack.count == 2 && !operations.isEmpty {
            switch operations {
            case "-":
                guard let number = subtraction() else { return nil }
                stack.removeAll()
                operations = ""
                return String(number)
            case "+":
                guard let number = addition() else { return nil }
                stack.removeAll()
                operations = ""
                return String(number)
            case "x":
                guard let number = multiplication() else { return nil }
                stack.removeAll()
                operations = ""
                return String(number)
            case "/":
                guard let number = division() else { return nil }
                stack.removeAll()
                operations = ""
                return String(number)
            default:
                stack.removeAll()
                return nil
            }
        }
        
        stack.removeAll()
        return nil
    }
    
    
    static func popStack() -> Int? {
        guard let number = stack.popLast() else { return nil }
        return number
        
    }
    
    static private func addition() -> Int? {
        if let firstNumber = popStack(), let secondNumber = popStack() {
            return firstNumber + secondNumber
        }
        return nil
    }
    
    static private func subtraction() -> Int? {
        if let firstNumber = popStack(), let secondNumber = popStack() {
            return secondNumber - firstNumber
        }
        return nil
    }
    
    static private func division() -> Double? {
        if let firstNumber = popStack(), let secondNumber = popStack() {
            return Double(secondNumber) / Double(firstNumber)
        }
        return nil
    }
    
    
    static private func multiplication() -> Int? {
        if let firstNumber = popStack(), let secondNumber = popStack() {
            print(firstNumber)
            print(secondNumber)
            return firstNumber * secondNumber
        }
        return nil
    }
    
    
}