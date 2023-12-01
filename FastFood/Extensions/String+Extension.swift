//
//  String+Extension.swift
//  FastFood
//
//  Created by Xcaret Mora on 30/11/23.
//

import UIKit

extension String {
    var asUrl: URL? {
        return URL(string: self)
    }
}
