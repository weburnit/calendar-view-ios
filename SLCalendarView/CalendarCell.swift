//
//  CalendarCell.swift
//  CalendarView
//
//  Created by Nguyen Duc Phi on 11/29/16.
//  Copyright © 2016 SweetPea. All rights reserved.
//

import UIKit
import AlamofireImage

class CalendarCell: UITableViewCell {
    
    static let CalendarCellIndentifier = "CalendarCellIdentifier"
    
    @IBOutlet weak var lbTime:          UILabel!
    @IBOutlet weak var lbTitle:         UILabel!
    @IBOutlet weak var lbPrice:         UILabel!
    @IBOutlet weak var lbName:          UILabel!
    @IBOutlet weak var lbRecommended:   UILabel!
    @IBOutlet weak var lbAddress:       UILabel!
    @IBOutlet weak var avatarImgView:   UIImageView!
    @IBOutlet weak var pinImgView:      UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        lbTime.textColor                    = UIColorFromRGB(rgbValue: CalendarConstants.Colors.time)
        lbPrice.textColor                   = UIColorFromRGB(rgbValue: CalendarConstants.Colors.time)
        lbName.textColor                    = UIColorFromRGB(rgbValue: CalendarConstants.Colors.name)
        lbRecommended.textColor             = UIColorFromRGB(rgbValue: CalendarConstants.Colors.name)
        lbAddress.textColor                 = UIColorFromRGB(rgbValue: CalendarConstants.Colors.name)
        avatarImgView.layer.cornerRadius    = 25
        avatarImgView.layer.masksToBounds   = true
    }
    
}
