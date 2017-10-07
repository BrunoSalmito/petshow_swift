//
//  LabelPadding.swift
//  Petshow_swift
//
//  Created by Bruno Salmito on 03/10/17.
//  Copyright © 2017 Bruno Salmito. All rights reserved.
//

import UIKit

class LabelPadding:UILabel {
    
    override func drawText(in rect: CGRect) {
        let insets = UIEdgeInsets.init(top: 1, left: 7, bottom: 1, right: 7)
        super.drawText(in: UIEdgeInsetsInsetRect(rect, insets))
    }
}


