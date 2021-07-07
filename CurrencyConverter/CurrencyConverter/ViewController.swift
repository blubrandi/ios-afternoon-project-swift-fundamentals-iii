//
//  ViewController.swift
//  CurrencyConverter
//
//  Created by Ben Gohlke on 8/7/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

// Added enum for currency case

enum Currency {
    case cad
    case mxn
}


class ViewController: UIViewController {
    
    // MARK: - Outlets/Properties
    
    @IBOutlet weak var fromCurrencyTextField: UITextField!
    @IBOutlet weak var toCurrencyTextField: UITextField!
    
    @IBOutlet weak var toCurrencyLabel: UILabel!
    
    @IBOutlet weak var cadButton: UIButton!
    @IBOutlet weak var mxnButton: UIButton!
// Start:  Assign the currency property to an initial value of .cad from enum.
    var currency: Currency =  .cad
    
    // MARK: - Actions
    
    @IBAction func convertButtonTapped(_ sender: UIButton) {
// 4.1  In the first guard let, we're assigning dollarString to the text of the fromCurrenyTextFird.
        guard let dollarString = fromCurrencyTextField.text else { return }
        
// 4.2  We're ensuring the text from the text input is a number, and converting it to a Double.  If it's not a number, we're returning a print error.
        guard let dollar = Double(dollarString) else {
            print("Invalid dollar amount (dollar amounts are supposed to be numbers, right?)")
            return
        }
        
// 4.3 We're setting conversion from our convert function to a Double and setting it to convert(dollar) -- (passing the user text input into the function)
        let conversion: Double = convert(dollar)
        
// 4.4 Probably an unneccessary if statement, but determines what happens to the specified text field (toCurrencyTextField) when the convertButtonTapped func is run and the convert func is run.

        if cadButton.isSelected {
            toCurrencyTextField.text = "\(conversion)"
        } else {
            toCurrencyTextField.text = "\(conversion)"
        }
    }
        
    // 1. Toggle buttons pressed from the initial value set at the beginning of the class.  Button toggles will happen in each button tap function in this case.  If the cadButton is selected, the currency from the enum case is set to .cad.  The text label will be updated to display the currency.
    @IBAction func cadButtonTapped(_ sender: UIButton) {
        cadButton.isSelected.toggle()
        mxnButton.isSelected.toggle()
        
        if cadButton.isSelected {
            currency = .cad
            toCurrencyLabel.text = "Currency (CAD)"
        }
    }
    
   // 2. Toggle buttons pressed from the initial value set at the beginning of the class.  Button toggles will happen in each button tap function in this case.  If the mxnButton is selected, the currency from the enum case is set to .mxn.  The text label will be updated to display the currency.
    @IBAction func mxnButtonTapped(_ sender: UIButton) {
        mxnButton.isSelected.toggle()
        cadButton.isSelected.toggle()
        
        if mxnButton.isSelected {
            currency = .mxn
            toCurrencyLabel.text = "Currency (MXN)"
        }
    }
    
    // MARK: - Helper Methods
    
// 3. Function written to perform the conversion.  If the currency is set to .cad, conversion will add the passed in dollars to be multiplied by the current conversion rate of 1.33.  Else (only other choice is mxn in this case), dollars will be multiplied by the current conversion rate of 19.79.
    
    func convert(_ dollars: Double) -> Double {

            var conversion: Double
            
            if currency == .cad {
                conversion = dollars * 1.33
            } else {
                conversion = dollars * 19.79
            }
            return conversion
        }
}



