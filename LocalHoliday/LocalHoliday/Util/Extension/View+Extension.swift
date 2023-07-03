//
//  View+Extension.swift
//  LocalHoliday
//
//  Created by 정종인 on 2023/07/04.
//

import SwiftUI
extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
