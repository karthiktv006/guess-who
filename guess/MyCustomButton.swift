//
//  MyCustomButton.swift
//  Guess who
//
//  Created by Viswanath-Contractor, Karthik (CORP) on 12/21/15.
//  Copyright © 2015 adp. All rights reserved.
//

import Foundation
import UIKit



class MyCustomButton: UIButton {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.layer.cornerRadius = 10.0;
        self.layer.borderColor = UIColor.blackColor().CGColor
        self.layer.borderWidth = 1.0
        //self.backgroundColor = UIColor.blueColor()
        //self.tintColor = UIColor.whiteColor()
        
    }
}