//
//  NATools.swift
//  NewApp_SwiftUi
//
//  Created by 驱动新媒体 on 2022/7/7.
//

import Foundation
import SwiftUI


let Kwidth=UIScreen.main.bounds.width



func InitAppearance()
{
    //修改 TabBar 中的物件，例如图标文本等
    let itemAppearance = UITabBarItemAppearance()
    
    
    //图标颜色
    itemAppearance.normal.iconColor = UIColor(Color.white)
    itemAppearance.selected.iconColor = UIColor(Color.green)
    
    //文本颜色
    itemAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor(Color.white)]
    itemAppearance.selected.titleTextAttributes = [.foregroundColor: UIColor(Color.green)]
    
    //气泡背景颜色
    itemAppearance.normal.badgeBackgroundColor = UIColor(Color.red)
    itemAppearance.selected.badgeBackgroundColor = UIColor(Color.red)
    
    //气泡文本颜色
    itemAppearance.normal.badgeTextAttributes = [.foregroundColor: UIColor(Color.white)]
    itemAppearance.selected.badgeTextAttributes = [.foregroundColor: UIColor(Color.white)]
    
    // TabBar
    let appeareance = UITabBarAppearance()
    //这里就可以将我们上面设置的 itemAppearance 应用到 UITabBarAppearance() 的 stackedLayoutAppearance 属性中
    appeareance.stackedLayoutAppearance = itemAppearance
//    //背景图片
//    appeareance.backgroundImage = UIImage(named: "test")
//    //背景色
//    appeareance.backgroundColor = UIColor(Color.gray)
//    //上边框阴影
//    appeareance.shadowColor = UIColor(Color.gray)
//
//    //tabItem们的摆放格式：.automatic就是默认格式；.centered表示尽量往中间靠；.fill表示尽量填满TabBar。
//    appeareance.stackedItemPositioning = .centered
//    //tabItem们的间距，不过最大的效果就是和.fill格式一样，不会超出视图
//    appeareance.stackedItemSpacing = 2000
//
    //把之前的设置全部应用到视图中
    if #available(iOS 15.0, *) {
        UITabBar.appearance().scrollEdgeAppearance = appeareance
    } else {
        // Fallback on earlier versions
    }

    
}


