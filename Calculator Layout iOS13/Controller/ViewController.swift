//
//  ViewController.swift
//  Calculator Layout iOS13
//
//  Created by Angela Yu on 01/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var displayLabel: UILabel!
    
    private var isFinishedTypingNumber: Bool = true
    private var displayValue: Double {
        get {
            guard let number = Double(displayLabel.text!) else {
                fatalError("Cannot convert display label to double.")
            }
            return number
        }
        set {
            displayLabel.text = String(newValue)
        }
    }
    private var calculator = CalculatorLogic()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        
        isFinishedTypingNumber = true
        
        calculator.setNumber(displayValue)
        
        if let calMethod = sender.currentTitle {
            if let result = calculator.calculate(symbol: calMethod) {
                displayValue = result
            }
        }
    }
    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        
        if let num = sender.currentTitle {
           
            if isFinishedTypingNumber {
//                if num == "." {
//                    displayLabel.text = "0" + num
//                } else {
//                    displayLabel.text = num
//                }
                displayLabel.text = num
                isFinishedTypingNumber = false
            } else {
                

                if num == "."  {

                    let isInt = floor(displayValue) == displayValue

                    if !isInt {
                        return
                    }
                }
                displayLabel.text = displayLabel.text! + num
            }
            
        }
    }
    

}

