//
//  ViewController.swift
//  Calendar View
//
//  Created by Nguyen Duc Phi on 11/18/16.
//  Copyright © 2016 SweetPea. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var btnShowCalendar: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        btnShowCalendar.layer.cornerRadius  = 22
        btnShowCalendar.layer.masksToBounds = true
    }
    
    @IBAction func showCalendarAction(_ sender: Any) {
        performSegue(withIdentifier: "ShowCalendarSegue", sender: self)
    }
    
}

