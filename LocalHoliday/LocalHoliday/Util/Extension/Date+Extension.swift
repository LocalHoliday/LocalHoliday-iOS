//
//  Date+Extension.swift
//  LocalHoliday
//
//  Created by 정종인 on 2023/07/09.
//

import Foundation

extension Date {
    var stringFormat: String {
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = "yyyyMMdd"
//        return dateFormatter.string(from: self)
        String(Int64(self.timeIntervalSince1970 * 1000))
    }
}
