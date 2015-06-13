//
//  ViewController.swift
//  TextFieldChallengeApps
//
//  Created by Jason on 11/12/14.
//  Copyright (c) 2014 Udacity. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var zipCode: UITextField!
    @IBOutlet weak var dollarAmount: UITextField!
    @IBOutlet weak var textMessage: UITextField!
    
    @IBOutlet weak var editSwitch: UISwitch!
    
    let zipCodeDelegate = ZipCodeTextFieldDelegate()
    let dollarAmountDelegate = DollarAmountTextFieldDelegate()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //self.xyz = true
        self.zipCode.delegate = self.zipCodeDelegate
        self.dollarAmount.delegate = self.dollarAmountDelegate
        self.textMessage.delegate = self
        
        self.editSwitch.setOn(false, animated: false)
    }
    
    // Text Field Delegate

    func textFieldShouldBeginEditing(textField: UITextField) -> Bool {
        // This return the current state of either on or off value. Note the property name is "on" and can be
        // misleading for its state to be ON, a poor naming convention here.
        return self.editSwitch.on
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true;
    }
    

    @IBAction func toggleTheTextEditor(sender: AnyObject) {
        
        if !(sender as! UISwitch).on {
            self.textMessage.resignFirstResponder()
        }
    }

}

