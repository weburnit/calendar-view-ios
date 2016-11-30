//
//  SLCalendar.swift
//  CalendarView
//
//  Created by Nguyen Duc Phi on 11/30/16.
//  Copyright © 2016 SweetPea. All rights reserved.
//

import UIKit

public class SLCalendarView{
    
    public static func getBundleSLCalendarView() -> Bundle {
        let podBundle   = Bundle(for: SLCalendarView.self)
        let bundleURL   = podBundle.url(forResource: "SLCalendarView", withExtension: "bundle")
        let bundle      = Bundle(url: bundleURL!)!
        return bundle
    }
    
    public static func performSegueToSLCalendarView(caller: UIViewController) {
        let bundle      = SLCalendarView.getBundleSLCalendarView()
        let storyboard  = UIStoryboard(name: "Calendar", bundle: bundle)
        let vc          = storyboard.instantiateInitialViewController()!
        let navigationC = caller.navigationController
        if navigationC != nil {
            navigationC?.pushViewController(vc, animated: true)
        }else{
            caller.present(vc, animated: true, completion: nil)
        }
    }
    
}
