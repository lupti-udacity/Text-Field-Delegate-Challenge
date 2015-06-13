//
//  DollarAmountTextFieldDelegate.swift
//  TextFieldChallengeApps
//
//  Created by Lupti on 6/12/15.
//  Copyright (c) 2015 Udacity. All rights reserved.
//

import Foundation
import UIKit

class DollarAmountTextFieldDelegate: NSObject, UITextFieldDelegate {
    
    // Implement textField shouldChangeCharactersInRange delegate protocol
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        
        var oldString = textField.text as NSString
        var newString = oldString.stringByReplacingCharactersInRange(range, withString: string)
        var intString = String(newString)
        
        
        
        // Format the decimal string knowing that the field is limited to the numeric keypad
        if let cents = integerStringConverter(intString).toInt(){
            newString = "$" + self.dollarStringFormat(cents) + "." + self.centsStringFormat(cents)
            
        } else {
            newString = "$0.00"
        }
        
        textField.text = newString
        
        return false
    }
    
    // convert random numberic string to integer string 
    func integerStringConverter(intString: String) -> String {
        // Collect a decimal digit character set here. Wonder why the Swift didnt offer higher level of
        // function to handle digits from String that is known will be numeric restricted by the numeric keypad.
        // A backward and unfriendly step here.
        // Imagine this section of codes would be repeated by many people, talking about DRY codes. Sad.
        // Copied this from Udacity sample codes.
        let digits = NSCharacterSet.decimalDigitCharacterSet()
        // set the string placeholder
        var digitText = ""
        // loop through the string to weed out non numeric characters
        for c in intString.unicodeScalars{
            if digits.longCharacterIsMember(c.value){
                digitText.append(c)
            }
        }
        return digitText

    }
    
    // Format integer to Dollar only
    
    func dollarStringFormat(value: Int) -> String {
        return String(value / 100)
    }
    // Format integer to cents only
    func centsStringFormat(value: Int) -> String{
        // Apply modulo to extract remainders of two decimals
        let cents = value % 100
        var centsString = String(cents)
        
        if cents < 10 {
            //Prepend 0 if the cents is single digit
            centsString = "0" + centsString
        }
        return centsString
    }
    
    // Implement the textField begin editing protocol
    func textFieldDidBeginEditing(textField: UITextField) {
        if textField.text.isEmpty{
            textField.text = "$0.00"
        }
    }
    
    // Implement keyboard to retract when return key is pressed.
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}