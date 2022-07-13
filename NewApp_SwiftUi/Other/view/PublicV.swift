//
//  PublicV.swift
//  NewApp_SwiftUi
//
//  Created by 驱动新媒体 on 2022/7/13.
//

import Foundation

import SwiftUI
struct RoundedCorner: Shape {

    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}
