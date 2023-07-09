//
//  UIView+Extension.swift
//  LocalHoliday
//
//  Created by 정종인 on 2023/07/09.
//

import Foundation
import UIKit

extension UIView {
// This is the function to convert UIView to UIImage
    public func asUIImage() -> UIImage {
        let renderer = UIGraphicsImageRenderer(bounds: bounds)
        return renderer.image { rendererContext in
            layer.render(in: rendererContext.cgContext)
        }
    }
}
