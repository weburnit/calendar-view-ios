//
//  SLCalendar.swift
//  CalendarView
//
//  Created by Nguyen Duc Phi on 11/30/16.
//  Copyright © 2016 SweetPea. All rights reserved.
//

import UIKit

public class SLCalendarView{
    
    public static func performSegueToSLCalendarView(caller: UIViewController) {
        let podBundle   = Bundle(for: SLCalendarView.self)
        let bundleURL   = podBundle.url(forResource: "SLCalendarView", withExtension: "bundle")
        let bundle      = Bundle(url: bundleURL!)!
        let storyboard  = UIStoryboard(name: "CalendarStoryboard", bundle: bundle)
        let vc          = storyboard.instantiateInitialViewController()!
        caller.present(vc, animated: true, completion: nil)
    }
    
}
