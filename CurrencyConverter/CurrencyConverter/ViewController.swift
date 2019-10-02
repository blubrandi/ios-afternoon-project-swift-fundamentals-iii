//
//  ViewController.swift
//  CurrencyConverter
//
//  Created by Ben Gohlke on 8/7/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

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
    
    var currencyFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        return formatter
    }()
    
    var currency: Currency =  .cad
    
    // MARK: - Actions
    
    @IBAction func convertButtonTapped(_ sender: UIButton) {
        
        guard let dollarString = fromCurrencyTextField.text else { return }
        
        guard let dollar = Double(dollarString) else {
            print("Invalid dollar amount (dollar amounts are supposed to be numbers, right?)")
            return
        }
        
        let conversion: Double = convert(dollar)
        
        if cadButton.isSelected {
            toCurrencyTextField.text = "\(conversion)"
        } else {
            toCurrencyTextField.text = "\(conversion)"
        }
        
        
    }
        
    
    @IBAction func cadButtonTapped(_ sender: UIButton) {
        cadButton.isSelected.toggle()
        mxnButton.isSelected.toggle()
        
        if cadButton.isSelected {
            currency = .cad
            toCurrencyLabel.text = "Currency (CAD)"
        }
        
    }
    
    @IBAction func mxnButtonTapped(_ sender: UIButton) {
        mxnButton.isSelected.toggle()
        cadButton.isSelected.toggle()
        
        if mxnButton.isSelected {
            currency = .mxn
            toCurrencyLabel.text = "Currency (MXN)"
        }

    }
    
    // MARK: - Helper Methods
    
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



