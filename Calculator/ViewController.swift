//
//  ViewController.swift
//  Calculator
//
//  Created by Taylor Mott on 10/29/15.
//  Copyright © 2015 DevMountain. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Properties
    
    static  let sharedInstance = ViewController()
    
    var calculatedLabel = UILabel()
    var zeroButton = UIButton()
    var oneButton = UIButton()
    var twoButton = UIButton()
    var threeButton = UIButton()
    var fourButton = UIButton()
    var fiveButton = UIButton()
    var sixButton = UIButton()
    var sevenButton = UIButton()
    var eightButton = UIButton()
    var nineButton = UIButton()
    var plusButton = UIButton()
    var minusButton = UIButton()
    var divideButton = UIButton()
    var multiplicationButton = UIButton()
    var enterButton = UIButton()
    
    var displayNumber = ""
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        createLabel()
        createAllButtons()
        addConstraints()
        addTitlesToNumberButtons()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - UI Creation
    
    func createLabel() {
        calculatedLabel.translatesAutoresizingMaskIntoConstraints = false
        calculatedLabel.backgroundColor = UIColor.blackColor()
        calculatedLabel.textColor = .whiteColor()
        
        view.addSubview(calculatedLabel)
        
    }
    
    func createAllButtons() {
        let buttonArray = [zeroButton, sevenButton, eightButton, nineButton, divideButton, fourButton, fiveButton, sixButton, multiplicationButton, oneButton, twoButton, threeButton, minusButton, enterButton, plusButton]
        
        for button in buttonArray {
            button.translatesAutoresizingMaskIntoConstraints = false
            button.backgroundColor = UIColor.whiteColor()
            button.layer.borderWidth = 1
            button.clipsToBounds = true
            button.setTitleColor(UIColor.blackColor(), forState: .Normal)
            button.titleLabel?.font = UIFont(name: "Apple SD Gothic Neo", size: 30)
            button.layer.borderColor = UIColor.blackColor().CGColor
            button.addTarget(self, action: "buttonTappedOnScreen:", forControlEvents: .TouchUpInside)
            self.view.addSubview(button)
        }
        makeColor()
    }
 
    
    // MARK: - UI Color and Text
    
    func makeColor() {
        let buttonArray = [zeroButton, sevenButton, eightButton, nineButton, divideButton, fourButton, fiveButton, sixButton, multiplicationButton, oneButton, twoButton, threeButton, minusButton, enterButton, plusButton]
        for button in buttonArray {
            switch button {
            case zeroButton, oneButton, twoButton, threeButton, fourButton, fiveButton, sixButton, sevenButton, eightButton, nineButton:
                button.backgroundColor = UIColor(red: 0.667, green: 0.667, blue: 0.667, alpha: 1.00)
            case divideButton, multiplicationButton, minusButton, plusButton:
                button.backgroundColor = UIColor(red: 0.992, green: 0.502, blue: 0.137, alpha: 1.00)
                button.setTitleColor(.whiteColor(), forState: .Normal)
            default:
                button.backgroundColor = UIColor(red: 0.392, green: 0.541, blue: 0.404, alpha: 1.00)
                button.setTitleColor(.whiteColor(), forState: .Normal)
            }
        }
        calculatedLabel.text = "0"
        calculatedLabel.font = UIFont(name: "Apple SD Gothic Neo", size: 60)
        calculatedLabel.textAlignment = .Right
    }
    
    func addTitlesToNumberButtons() {
        let buttonArray = [zeroButton, oneButton, twoButton, threeButton, fourButton, fiveButton, sixButton, sevenButton, eightButton, nineButton]
        var count = 0
        for button in buttonArray {
            button.setTitle("\(count)", forState: .Normal)
            count++
        }
    }
    
    // MARK: - CONSTRAINTS
    
    func addConstraints() {
        
        // Calculated Label Horizontal and Vertical Constraints
        let calcHorizontalConstraint = NSLayoutConstraint(item: calculatedLabel, attribute: .CenterX, relatedBy: .Equal, toItem: self.view, attribute: .CenterX, multiplier: 1, constant: 0)
        let calcTopMarginContstraint = NSLayoutConstraint(item: calculatedLabel, attribute: .Top, relatedBy: .Equal, toItem: self.view, attribute: .Top, multiplier: 1, constant: 0)
        // Calculated Label Height and Width Constraints
        let calcWidthConstraints = NSLayoutConstraint(item: calculatedLabel, attribute: .Width, relatedBy: .Equal, toItem: self.view, attribute: .Width, multiplier: 1, constant: 0)
        let calcHeightConstraints = NSLayoutConstraint(item: calculatedLabel, attribute: .Height, relatedBy: .Equal, toItem: self.view, attribute: .Height, multiplier: 0.30, constant: 0)
        
        self.view.addConstraints([ calcHorizontalConstraint, calcHeightConstraints, calcWidthConstraints, calcTopMarginContstraint])
        
        createWidthAndHeightConstraintForButtons()
    }
    
    func createWidthAndHeightConstraintForButtons() {
        
        // Add Height and Width Constraints
        let buttonArray = [zeroButton, sevenButton, eightButton, nineButton, divideButton, fourButton, fiveButton, sixButton, multiplicationButton, oneButton, twoButton, threeButton, minusButton, enterButton, plusButton]
        for button in buttonArray {
            if button == zeroButton {
                let heightConstraint = NSLayoutConstraint(item: button, attribute: .Height, relatedBy: .Equal, toItem: self.view, attribute: .Height, multiplier: 0.175, constant: 0)
                let widthConstraint = NSLayoutConstraint(item: button, attribute: .Width, relatedBy: .Equal, toItem: self.view, attribute: .Width, multiplier: 0.5, constant: 0)
                self.view.addConstraints([heightConstraint, widthConstraint])
            } else {
                let heightConstraint = NSLayoutConstraint(item: button, attribute: .Height, relatedBy: .Equal, toItem: self.view, attribute: .Height, multiplier: 0.175, constant: 0)
                let widthConstraint = NSLayoutConstraint(item: button, attribute: .Width, relatedBy: .Equal, toItem: self.view, attribute: .Width, multiplier: 0.25, constant: 0)
                self.view.addConstraints([heightConstraint, widthConstraint])
            }
            multiplicationButton.setTitle("x", forState: .Normal)
            divideButton.setTitle("/", forState: .Normal)
            minusButton.setTitle("-", forState: .Normal)
            plusButton.setTitle("+", forState: .Normal)
            enterButton.setTitle("Enter", forState: .Normal)
        }
        
        // Add button horizontal Constraint
        for button in buttonArray {
            switch button {
            case sevenButton, fourButton, oneButton, zeroButton:
                let buttonHorizontalConstraint = NSLayoutConstraint(item: button, attribute: .Leading, relatedBy: .Equal, toItem: self.view, attribute: .Leading, multiplier: 1, constant: 0)
                self.view.addConstraint(buttonHorizontalConstraint)
            case divideButton, multiplicationButton, minusButton, plusButton:
                let buttonHorizontalConstraint = NSLayoutConstraint(item: button, attribute: .Trailing, relatedBy: .Equal, toItem: self.view, attribute: .Trailing, multiplier: 1, constant: 0)
                self.view.addConstraint(buttonHorizontalConstraint)
            case eightButton, fiveButton, twoButton:
                let buttonHorizontalConstraint = NSLayoutConstraint(item: button, attribute: .Leading, relatedBy: .Equal, toItem: sevenButton, attribute: .Trailing, multiplier: 1, constant: 0)
                self.view.addConstraint(buttonHorizontalConstraint)
            case nineButton, sixButton, threeButton:
                let buttonHorizontalConstraint = NSLayoutConstraint(item: button, attribute: .Leading, relatedBy: .Equal, toItem: eightButton, attribute: .Trailing, multiplier: 1, constant: 0)
                self.view.addConstraint(buttonHorizontalConstraint)
            case enterButton:
                let buttonHorizontalConstraint = NSLayoutConstraint(item: button, attribute: .Leading, relatedBy: .Equal, toItem: zeroButton, attribute: .Trailing, multiplier: 1, constant: 0)
                self.view.addConstraint(buttonHorizontalConstraint)
            default:
                return
            }
        }
        
        // Add Button Vertical Constraint
        for button in buttonArray {
            switch button {
            case sevenButton, eightButton, nineButton, divideButton:
                let buttonVerticalConstraint = NSLayoutConstraint(item: button, attribute: .Top, relatedBy: .Equal, toItem: calculatedLabel, attribute: .Bottom, multiplier: 1, constant: 0)
                self.view.addConstraint(buttonVerticalConstraint)
            case fourButton, fiveButton, sixButton, multiplicationButton:
                let buttonVerticalConstraint = NSLayoutConstraint(item: button, attribute: .Top, relatedBy: .Equal, toItem: eightButton, attribute: .Bottom, multiplier: 1, constant: 0)
                self.view.addConstraint(buttonVerticalConstraint)
            case oneButton, twoButton, threeButton, minusButton:
                let buttonVerticalConstraint = NSLayoutConstraint(item: button, attribute: .Top, relatedBy: .Equal, toItem: fiveButton, attribute: .Bottom, multiplier: 1, constant: 0)
                self.view.addConstraint(buttonVerticalConstraint)
            case zeroButton, enterButton, plusButton:
                let buttonVerticalConstraint = NSLayoutConstraint(item: button, attribute: .Top, relatedBy: .Equal, toItem: threeButton, attribute: .Bottom, multiplier: 1, constant: 0)
                self.view.addConstraint(buttonVerticalConstraint)
            default:
                return
            }
        }
    }
    
    // MARK: - BUTTON ACTION FUNCTIONS
    
    func buttonTappedOnScreen(sender: UIButton!) {
        switch sender {
        case divideButton, multiplicationButton, minusButton, plusButton:
            guard let operation = sender.titleLabel?.text else { return }
            calculatedLabel.text = operation
            CalculatorController.operations(operation)
        case enterButton:
            displayNumber = ""
            if let number = CalculatorController.enter() {
                calculatedLabel.text = number
            }
        default:
            guard let number = sender.titleLabel?.text else { return }
            self.displayNumber += number
            calculatedLabel.text = self.displayNumber
            CalculatorController.number(number)
        }
    }
}