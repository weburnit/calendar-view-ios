//
//  ViewController.swift
//  CalendarView
//
//  Created by Nguyen Duc Phi on 11/19/16.
//  Copyright © 2016 SweetPea. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func showCalendarAction(_ sender: Any) {
        performSegue(withIdentifier: "ShowCalendarSegue", sender: self)
    }

}

