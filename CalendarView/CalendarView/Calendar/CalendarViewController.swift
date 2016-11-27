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
    
    @IBOutlet weak var topView:         UIView!
    @IBOutlet weak var calendarMenu:    CVCalendarMenuView!
    @IBOutlet weak var calendarView:    CVCalendarView!
    @IBOutlet weak var lbCurrentDate:   UILabel!
    var selectedDay:                    CVCalendarDayView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        transparentNavigationBar()
        addGradientLayer(view: topView, colors: [UIColorFromRGB(rgbValue: 0x9754C8).cgColor, UIColorFromRGB(rgbValue: 0x42B6B4).cgColor])
        lbCurrentDate.text = dateToStringWith(date: calendarView.manager.currentDate, dateFormatStr: "yyyy - MMM")
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
        calendarView.commitCalendarViewUpdate()
    }
    
    @IBAction func tapCurrentDateTitle(_ sender: Any) {
        
    }
}

extension CalendarViewController: CVCalendarMenuViewDelegate {
    
    func firstWeekday() -> Weekday {
        return .monday
    }
    
    func dayOfWeekTextColor(by weekday: Weekday) -> UIColor {
        return UIColorFromRGB(rgbValue: 0xFFFFFF, alpha: 0.7)
    }
    
    func dayOfWeekFont() -> UIFont {
        return UIFont.init(name: "HelveticaNeue-Bold", size: 12)!
    }
}

extension CalendarViewController: CVCalendarViewDelegate {
    
    func presentationMode() -> CalendarMode {
        return .weekView
    }

    func shouldShowWeekdaysOut() -> Bool {
        return true
    }
    
    func selectionViewPath() -> ((CGRect) -> (UIBezierPath)) {
        return {UIBezierPath.init(roundedRect: CGRect(x: 12, y: 9, width: $0.width - 24, height: $0.height - 18), cornerRadius: 5)}
    }
    
    func shouldShowCustomSingleSelection() -> Bool {
        return true
    }
    
    func shouldSelectDayView(_ dayView: DayView) -> Bool {
        return true
    }
    
    func didSelectDayView(_ dayView: CVCalendarDayView, animationDidFinish: Bool) {
        selectedDay = dayView
        lbCurrentDate.text = dateToStringWith(date: (selectedDay?.date.convertedDate())!, dateFormatStr: "yyyy - MMM")
    }
    
}

extension CalendarViewController: CVCalendarViewAppearanceDelegate {
    
    func dayLabelColor(by weekDay: Weekday, status: CVStatus, present: CVPresent) -> UIColor? {
        switch (weekDay, status, present) {
        case (_, .selected, .present),  (_, .highlighted, .present):    return UIColorFromRGB(rgbValue: 0x0072BB)
        case (_, .selected, _),         (_, .highlighted, _):           return UIColorFromRGB(rgbValue: 0x000000, alpha: 0.7)
        case (_, _, .present):                                          return UIColorFromRGB(rgbValue: 0x0072BB)
        case (_, .out, _):                                              return UIColorFromRGB(rgbValue: 0x000000, alpha: 0.1)
        default:                                                        return UIColorFromRGB(rgbValue: 0xFFFFFF, alpha: 0.7)
        }
    }
    
    func dayLabelFont(by weekDay: Weekday, status: CVStatus, present: CVPresent) -> UIFont {
        return UIFont.init(name: "HelveticaNeue-Bold", size: 14)!
    }
    
    func dayLabelBackgroundColor(by weekDay: Weekday, status: CVStatus, present: CVPresent) -> UIColor? {
        switch (weekDay, status, present) {
            case (_, .selected, _), (_, .highlighted, _):   return UIColor.white
            default:                                        return nil
        }
    }
}
