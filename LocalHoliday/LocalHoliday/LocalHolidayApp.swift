//
//  LocalHolidayApp.swift
//  LocalHoliday
//
//  Created by 정종인 on 2023/06/30.
//

import SwiftUI

@main
struct LocalHolidayApp: App {
    var body: some Scene {
        WindowGroup {
//            LoginView()
//            ContentView()
//                .environmentObject(ModelData())
//                .environmentObject(AuthData())
            NavigationStack {
                SignUpManageView()
            }
        }
    }
}
