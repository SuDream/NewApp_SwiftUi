//
//  AppBar.swift
//  NewApp_SwiftUi
//
//  Created by 驱动新媒体 on 2022/7/8.
//

import SwiftUI

struct AppBar<Content:View>: View {
    
    let safeAreaInsets = UIApplication.shared.windows.first?.safeAreaInsets
    private let padding:CGFloat = 8.0
    
    private var appBarHeight:CGFloat{
        //appBar 高度 + 流海高度 + 上下 padding
        45 + (safeAreaInsets?.top ?? 0) + padding * 2
    }
    
    private var content:Content
    init(@ViewBuilder content:()-> Content) {
        self.content=content()
    }
    
    var body: some View {
        HStack{
            self.content
        }.foregroundColor(.white)
            
            .padding(.top,safeAreaInsets?.top ?? 0 + padding)
            .padding(.bottom,padding)
            .padding(.horizontal,4.0)
            .frame(height: appBarHeight)
            .background(LinearGradient(gradient: Gradient(colors: [Color(red: 20/255.0, green: 158/255.0, blue: 231/255.0), Color(red: 45/255.0, green: 205/255.0, blue: 245/255.0)]), startPoint: .leading, endPoint: .trailing))
    }
}

//struct AppBar_Previews: PreviewProvider {
//    static var previews: some View {
//        AppBar()
//    }
//}
