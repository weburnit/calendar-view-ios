//
//  CalendarUtils.swift
//  CalendarView
//
//  Created by Nguyen Duc Phi on 11/23/16.
//  Copyright © 2016 SweetPea. All rights reserved.
//

import UIKit

func UIColorFromRGB(rgbValue: UInt, alpha: CGFloat = 1.0) -> UIColor {
    return UIColor(
        red:    CGFloat((rgbValue & 0xFF0000) >> 16)    / 0xFF,
        green:  CGFloat((rgbValue & 0x00FF00) >> 8)     / 0xFF,
        blue:   CGFloat(rgbValue & 0x0000FF)            / 0xFF,
        alpha:  CGFloat(alpha)
    )
}

func transparentNavigationBar(naviController: UINavigationController?){
    if (naviController != nil) {
        naviController?.navigationBar.titleTextAttributes     = [NSForegroundColorAttributeName: UIColor.clear]
        naviController?.navigationBar.tintColor               = UIColor.clear
        naviController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        naviController?.navigationBar.shadowImage             = UIImage()
        naviController?.navigationBar.isTranslucent           = true
        naviController?.view.backgroundColor                  = UIColor.clear
    }
}

func addGradientLayer(view: UIView, colors: [CGColor], frame: CGRect = CGRect.zero){
    let gradient: CAGradientLayer   = CAGradientLayer()
    gradient.frame                  = frame == CGRect.zero ? view.bounds : frame
    gradient.colors                 = colors
    gradient.startPoint             = CGPoint.init(x: 0, y: 0.5)
    gradient.endPoint               = CGPoint.init(x: 1, y: 0.5)
    view.layer.insertSublayer(gradient, at: 0)
}

func dateToStringWith(date: Date, dateFormatStr: String) -> String{
    let dateformatter           = DateFormatter()
    dateformatter.dateFormat    = dateFormatStr
    return dateformatter.string(from: date)
}

func getDayOfWeek(date: Date)->Int {
    let calendar = NSCalendar.current
    return calendar.component(.weekday, from: date)
}
