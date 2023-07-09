//
//  Date+Extension.swift
//  LocalHoliday
//
//  Created by 정종인 on 2023/07/09.
//

import Foundation

extension Date {
    var serverSendingFormat: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter.string(from: self) + " 00:00:00"
    }
    
    var localizedFormat: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy년 MM월 dd일"
        return dateFormatter.string(from: self)
    }
    
    static func fromISOString(_ dateString: String) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "ko_KR")
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
        return dateFormatter.date(from: dateString)
    }
}
