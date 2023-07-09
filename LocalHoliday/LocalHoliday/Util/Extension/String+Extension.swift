//
//  String+Extension.swift
//  LocalHoliday
//
//  Created by 정종인 on 2023/07/09.
//

import Foundation

extension String {
//    func toDateIfIsoFormatted() -> Date? {
//        Date.fromISOString(self)
//    }
    
    var toDateIfIsoFormatted: Date? {
        Date.fromISOString(self)
    }
}
