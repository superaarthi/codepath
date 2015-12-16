//
//  ViewController.swift
//  MoneyBunny
//
//  Created by Labuser on 12/15/15.
//  Copyright (c) 2015 wustl. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var billField: UITextField!
    @IBOutlet var tipLabel: UILabel!
    @IBOutlet var totalLabel: UILabel!
    @IBOutlet var tipControl: UISegmentedControl!
    
    let defaults = NSUserDefaults.standardUserDefaults()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
        billField.becomeFirstResponder()
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "onEditingChanged:", name: UIApplicationWillEnterForegroundNotification, object: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onEditingChanged(sender: AnyObject) {
        var tipPercents = [0.18, 0.2, 0.22]
        var tipPercent = tipPercents[tipControl.selectedSegmentIndex]
        
        var billAmount = NSString(string:billField.text!).doubleValue
        var tip = billAmount * tipPercent
        var total = billAmount + tip
        
        let formatter = NSNumberFormatter()
        formatter.numberStyle = .CurrencyStyle
        
        tipLabel.text = formatter.stringFromNumber(tip)
        totalLabel.text = formatter.stringFromNumber(total)
    }

    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
    
    override func viewWillAppear(animated: Bool) {
        tipControl.selectedSegmentIndex = defaults.integerForKey("defaultTip")
        onEditingChanged(tipControl)
    }
    
}

