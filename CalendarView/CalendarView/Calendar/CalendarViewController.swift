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
    @IBOutlet weak var arrowView:       ArrowView!
    var selectedDay                     = Date()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        arrowView.reload()
    }
    
    func setupViews(){
        transparentNavigationBar(naviController: navigationController)
        var frameGradientLayer          = topView.bounds
        var frameCalendarView           = calendarView.bounds
        frameGradientLayer.size.width   = UIScreen.main.bounds.width
        frameCalendarView.size.width    = UIScreen.main.bounds.width
        calendarView.frame              = frameCalendarView
        addGradientLayer(view: topView, colors: [UIColorFromRGB(rgbValue: CalendarConstants.Colors.left).cgColor, UIColorFromRGB(rgbValue: CalendarConstants.Colors.right).cgColor], frame: frameGradientLayer)
        lbCurrentDate.text              = dateToStringWith(date: calendarView.manager.currentDate, dateFormatStr: CalendarConstants.Formats.date_top)
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
        return UIColorFromRGB(rgbValue: CalendarConstants.Colors.white, alpha: 0.7)
    }
    
    func dayOfWeekFont() -> UIFont {
        return UIFont.init(name: CalendarConstants.Fonts.helvetica_neue_bold, size: 12)!
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
        selectedDay = dayView.date.convertedDate()!
        lbCurrentDate.text = dateToStringWith(date: selectedDay, dateFormatStr: CalendarConstants.Formats.date_top)
        arrowView.reload()
        
    }
    
}

extension CalendarViewController: CVCalendarViewAppearanceDelegate {
    
    func dayLabelColor(by weekDay: Weekday, status: CVStatus, present: CVPresent) -> UIColor? {
        switch (weekDay, status, present) {
        case (_, .selected, .present),  (_, .highlighted, .present):    return UIColorFromRGB(rgbValue: CalendarConstants.Colors.present)
        case (_, .selected, _),         (_, .highlighted, _):           return UIColorFromRGB(rgbValue: CalendarConstants.Colors.black, alpha: 0.7)
        case (_, _, .present):                                          return UIColorFromRGB(rgbValue: CalendarConstants.Colors.present)
        case (_, .out, _):                                              return UIColorFromRGB(rgbValue: CalendarConstants.Colors.black, alpha: 0.1)
        default:                                                        return UIColorFromRGB(rgbValue: CalendarConstants.Colors.white, alpha: 0.7)
        }
    }
    
    func dayLabelFont(by weekDay: Weekday, status: CVStatus, present: CVPresent) -> UIFont {
        return UIFont.init(name: CalendarConstants.Fonts.helvetica_neue_bold, size: 14)!
    }
    
    func dayLabelBackgroundColor(by weekDay: Weekday, status: CVStatus, present: CVPresent) -> UIColor? {
        switch (weekDay, status, present) {
            case (_, .selected, _), (_, .highlighted, _):   return UIColor.white
            default:                                        return nil
        }
    }
}

extension CalendarViewController: ArrowViewDelegate {
    
    func numbersArrows() -> Int {
        return 7
    }
    
    func currentArrowIndex() -> Int {
        let weekDay = getDayOfWeek(date: selectedDay)
        if weekDay == 1 {
            return 6
        }else{
            return weekDay - 2
        }
    }
    
}
