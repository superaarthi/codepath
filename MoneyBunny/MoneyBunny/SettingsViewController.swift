//
//  SettingsViewController.swift
//  MoneyBunny
//
//  Created by Labuser on 12/15/15.
//  Copyright (c) 2015 wustl. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet var percentControl: UISegmentedControl!

    let defaults = NSUserDefaults.standardUserDefaults()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        percentControl.selectedSegmentIndex = defaults.integerForKey("defaultTip")

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onDefaultChanged(sender: AnyObject) {
        defaults.setInteger(percentControl.selectedSegmentIndex, forKey: "defaultTip")
        defaults.synchronize()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
