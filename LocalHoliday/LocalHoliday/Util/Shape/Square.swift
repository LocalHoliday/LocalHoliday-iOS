//
//  Square.swift
//  LocalHoliday
//
//  Created by 정종인 on 2023/07/03.
//

import SwiftUI

struct Square: Shape {
    func path(in rect: CGRect) -> Path {
        let side = min(rect.maxX, rect.maxY)
        return Path { path in
            path.move(to: CGPoint(x: rect.midX, y: rect.midY - side / 2))
            path.addLine(to: CGPoint(x: rect.midX + side / 2, y: rect.midY - side / 2))
            path.addLine(to: CGPoint(x: rect.midX + side / 2, y: rect.midY + side / 2))
            path.addLine(to: CGPoint(x: rect.midX - side / 2, y: rect.midY + side / 2))
            path.addLine(to: CGPoint(x: rect.midX - side / 2, y: rect.midY - side / 2))
        }
    }
}
