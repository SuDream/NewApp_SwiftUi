//
//  SDExtension.swift
//  NewApp_SwiftUi
//
//  Created by 驱动新媒体 on 2022/7/11.
//

import Foundation

import SwiftUI
extension String
{
    
}


extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
}
