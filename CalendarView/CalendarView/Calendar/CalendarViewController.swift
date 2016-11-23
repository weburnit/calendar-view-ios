//
//  CalendarViewController.swift
//  CalendarView
//
//  Created by Nguyen Duc Phi on 11/19/16.
//  Copyright © 2016 SweetPea. All rights reserved.
//

import UIKit
import CVCalendar

class CalendarViewController: UIViewController {
    @IBOutlet weak var topView: UIView!

    @IBOutlet weak var calendarMenu: CVCalendarMenuView!
    override func viewDidLoad() {
        super.viewDidLoad()
        transparentNavigationBar()
        addGradientLayer(view: topView, colors: [UIColorFromRGB(rgbValue: 0x9754C8).cgColor, UIColorFromRGB(rgbValue: 0x42B6B4).cgColor])
    }
    
    func transparentNavigationBar(){
        if (navigationController != nil) {
            navigationController?.navigationBar.titleTextAttributes     = [NSForegroundColorAttributeName: UIColor.clear]
            navigationController?.navigationBar.tintColor               = UIColor.clear
            navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
            navigationController?.navigationBar.shadowImage             = UIImage()
            navigationController?.navigationBar.isTranslucent           = true
            navigationController?.view.backgroundColor                  = UIColor.clear
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        calendarMenu.commitMenuViewUpdate()
    }
}

extension CalendarViewController: CVCalendarMenuViewDelegate{
    
    func firstWeekday() -> Weekday {
        return .monday
    }
    
    func dayOfWeekTextColor() -> UIColor {
        return UIColorFromRGB(rgbValue: 0xFFFFFF, alpha: 0.7)
    }
    
    func dayOfWeekFont() -> UIFont {
        return UIFont.init(name: "HelveticaNeue-Bold", size: 10)!
    }
}
