//
//  SwiperView.swift
//  NewApp_SwiftUi
//
//  Created by 驱动新媒体 on 2022/7/12.
//

import Foundation
import SwiftUI

struct SwiperView<SwiperItem:View>:View
{
    
    var items:[SwiperItem]
    @Binding var currentPage:Int
    private let timer = Timer.publish(every: 3, on: .current, in: .common).autoconnect()
    var body : some View{
        
        
        ZStack(alignment:.bottom)
        {
            Swiper(items: items, currentPage: $currentPage)
            SwiperControl(numOfPages: items.count, currentPage: $currentPage)
        }.aspectRatio(7/3,contentMode: .fit)
        .onReceive(timer, perform: { _ in
                currentPage += 1
                if currentPage >= items.count{
                    currentPage = 0
                }
            })
        
        
    }
    
}
