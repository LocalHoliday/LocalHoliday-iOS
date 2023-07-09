//
//  Date+Extension.swift
//  LocalHoliday
//
//  Created by 정종인 on 2023/07/09.
//

import Foundation

extension Date {
    var stringFormat: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter.string(from: self) + " 00:00:00"
    }
}
