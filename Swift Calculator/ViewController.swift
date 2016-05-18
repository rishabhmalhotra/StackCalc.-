//
//  ViewController.swift
//  Swift Calculator
//
//  Created by Rishabh Malhotra on 4/20/16.
//  Copyright © 2016 Stanford. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var display: UILabel!
    
    var isuserinthemiddleoftyping = false
    
    @IBAction func buttonappend(sender: UIButton) {
        let digit = sender.currentTitle!
        
        if isuserinthemiddleoftyping {
            display.text = display.text! + digit
        } else {
            display.text = digit
            isuserinthemiddleoftyping = true
        }
        //print("digit = \(digit)")
    }
    
    @IBAction func operand(sender: UIButton) {
        let operation = sender.currentTitle!
        if isuserinthemiddleoftyping {
            enter()
        }
        switch operation {
            case "÷":
                if internalStack.count >= 2 {
                    displayValue = internalStack.removeLast() / internalStack.removeLast()
                    enter()
                }
        case "×":
            if internalStack.count >= 2 {
                displayValue = internalStack.removeLast() * internalStack.removeLast()
                enter()
            }
        case "+":
            if internalStack.count >= 2 {
                displayValue = internalStack.removeLast() + internalStack.removeLast()
                enter()
            }
        case "−":
            if internalStack.count >= 2 {
                displayValue = internalStack.removeLast() - internalStack.removeLast()
                enter()
            }
            
        default: break
        }
    }
    
    
    
    @IBAction func eraser(sender: UIButton) {
        if isuserinthemiddleoftyping {
            display.text = "0"
            isuserinthemiddleoftyping = false
            internalStack.removeAll()
        }
    }
    
    @IBAction func enter() {
        isuserinthemiddleoftyping = false
        internalStack.append(displayValue)
        print("internal stack = \(internalStack)")
    }
    
    var internalStack = Array<Double>()
    var displayValue: Double {
        get {
            return NSNumberFormatter().numberFromString(display.text!)!.doubleValue
        }
        set {
            display.text = "\(newValue)"
            isuserinthemiddleoftyping = false
        }
    }
}

