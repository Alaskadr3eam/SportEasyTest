//
//  AppTheme.swift
//  SportEasyTest
//
//  Created by Clément Martin on 20/06/2021.
//

import Foundation
import UIKit

struct AppTheme {
    struct AppColor {
        static let blueSE: UIColor = UIColor(displayP3Red: 3.0 / 255.0,
                                             green: 14.0 / 255.0,
                                             blue: 47.0 / 255.0,
                                             alpha: 1)
        static let appBackground: UIColor = UIColor(white: 247.0 / 255.0,
                                                    alpha: 1)
        static let greyText: UIColor = UIColor(displayP3Red: 140.0 / 255.0 ,
                                               green: 146.0 / 255.0,
                                               blue: 154.0 / 255.0,
                                               alpha: 1)
        static let darkText: UIColor = UIColor(white: 57.0 / 255.0,
                                               alpha: 1)
        static let greenText: UIColor = UIColor(red: 75.0 / 255.0,
                                                green: 204.0 / 255.0,
                                                blue: 31.0 / 255.0,
                                                alpha: 1)
        static let redText: UIColor = UIColor(red: 254.0 / 255.0,
                                              green: 56.0 / 255.0,
                                              blue: 36.0 / 255.0,
                                              alpha: 1)
    }

    struct AppFont {
        static let dateFontSize = UIFont(name: "Helvetica-Bold",
                                         size: 15)!
        static let hourFontSize = UIFont(name: "Helvetica",
                                         size: 13)!
        static let nameAndScoreFontSize1 = UIFont(name: "Helvetica-Bold",
                                                  size: 17)!
    }
}
