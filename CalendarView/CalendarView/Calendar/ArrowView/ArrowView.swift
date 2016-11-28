//
//  ArrowView.swift
//  CalendarView
//
//  Created by Nguyen Duc Phi on 11/27/16.
//  Copyright © 2016 SweetPea. All rights reserved.
//

import UIKit

@objc
public protocol ArrowViewDelegate {
    func numbersArrows() -> Int
    func currentArrowIndex() -> Int
}

class ArrowView: UIView {
    
    public weak var delegate: ArrowViewDelegate?
    private let arrowView       = UIView()
    private let imgArrow        = UIImageView()
    private var allConstraints  = [NSLayoutConstraint]()
    
    @IBOutlet public weak var arrowDelegate: AnyObject? {
        set {
            if let arrowDelegate = newValue as? ArrowViewDelegate {
                delegate = arrowDelegate
            }
        }
        get {
            return delegate
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initCommon()
    }
    
    private func initCommon() {
        arrowView.translatesAutoresizingMaskIntoConstraints = false
        imgArrow.translatesAutoresizingMaskIntoConstraints  = false
        arrowView.backgroundColor                           = UIColor.clear
        imgArrow.backgroundColor                            = UIColor.clear
        imgArrow.image                                      = UIImage(named: "ic_arrow_up.png")
        imgArrow.contentMode                                = .scaleAspectFit
        imgArrow.isHidden                                   = true
        arrowView.addSubview(imgArrow)
        addSubview(arrowView)
    }
    
    func reload() {
        addConstraintForView()
    }
    
    private func addConstraintForView(){
        NSLayoutConstraint.deactivate(allConstraints)
        allConstraints.removeAll()
        imgArrow.isHidden           = false
        let width                   = Int(bounds.width)/(delegate?.numbersArrows())!
        let views                   = ["arrowView":arrowView, "imgArrow":imgArrow]
        let spaceLeftConstraints    = NSLayoutConstraint.constraints(withVisualFormat: "H:|-\((delegate?.currentArrowIndex())!*width)-[arrowView(\(width))]", options: [], metrics: nil, views: views)
        let verticalConstraints     = NSLayoutConstraint.constraints(withVisualFormat: "V:|-0-[arrowView]-0-|", options: [], metrics: nil, views: views)
        let heightImageConstraints  = NSLayoutConstraint.constraints(withVisualFormat: "V:[imgArrow(10)]-0-|", options: [], metrics: nil, views: views)
        let widthImageConstraints   = NSLayoutConstraint.constraints(withVisualFormat: "H:|[imgArrow(20)]|", options: [], metrics: nil, views: views)
        allConstraints              += spaceLeftConstraints
        allConstraints              += verticalConstraints
        allConstraints              += heightImageConstraints
        allConstraints              += widthImageConstraints
        NSLayoutConstraint.activate(allConstraints)
    }
}
