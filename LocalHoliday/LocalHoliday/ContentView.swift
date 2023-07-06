//
//  ContentView.swift
//  LocalHoliday
//
//  Created by 정종인 on 2023/06/30.
//

import SwiftUI

struct ContentView: View {
    @State private var selection = 2
    var body: some View {
        TabView(selection: $selection) {
            NavigationStack {
                PickItemView()
            }
            .tabItem {
                Image.Reservation
                    .renderingMode(.template)
                Text("일정잡기")
                    .font(.B4R)
            }
            .tag(1)
            
            NavigationStack {
                HomeView()
            }
            .tabItem {
                Image.Home
                    .renderingMode(.template)
                Text("홈")
                    .font(.B4R)
            }
            .tag(2)
            
            NavigationStack {
                HomeView()
            }
            .tabItem {
                Image.Person
                    .renderingMode(.template)
                Text("내정보")
                    .font(.B4R)
            }
            .tag(3)
        }
        .tint(.Primary)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData())
    }
}
