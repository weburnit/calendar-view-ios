//
//  CalendarViewController.swift
//  CalendarView
//
//  Created by Nguyen Duc Phi on 11/19/16.
//  Copyright © 2016 SweetPea. All rights reserved.
//

import UIKit

class CalendarViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        transparentNavigationBar()
    }
    
    func transparentNavigationBar(){
        if (navigationController != nil) {
            navigationController?.navigationBar.titleTextAttributes    = [NSForegroundColorAttributeName: UIColor.clear]
            navigationController?.navigationBar.tintColor              = UIColor.clear
            navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
            navigationController?.navigationBar.shadowImage            = UIImage()
            navigationController?.navigationBar.isTranslucent          = true
            navigationController?.view.backgroundColor = UIColor.clear
        }
    }
}
