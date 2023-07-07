//
//  Image+Extension.swift
//  LocalHoliday
//
//  Created by 정종인 on 2023/06/30.
//

import Foundation
import SwiftUI

extension Image {
    // MARK: - Image
    static let 경기 = Image("경기")
    static let LocalHoliday = Image("LocalHoliday")
    static let Splash = Image("Splash")
    static let Firefly = Image("Firefly")
    static let Onboarding1 = Image("Onboarding1")
    static let Onboarding2 = Image("Onboarding2")
    static let Onboarding3 = Image("Onboarding3")
    static let Onboarding4 = Image("Onboarding4")

    // MARK: - ICON
    static let Home = Image("Home")
    static let Person = Image("Person")
    static let Reservation = Image("Reservation")
    static let Search = Image("Search")
    static let Star = Image("Star")
    static let Mappin = Image("Mappin")
    static let CheckmarkFilled = Image("CheckmarkFilled")
    static let Time = Image("Time")
    static let LogOut = Image("LogOut")
    static let CalendarEdit = Image("CalendarEdit")
    static let Bookmark = Image("Bookmark")
    static let Scrap = Image("Scrap")
    
    // MARK: - Default
    static let `defaultUser` = Image(systemName: "person").renderingMode(.template)
}
