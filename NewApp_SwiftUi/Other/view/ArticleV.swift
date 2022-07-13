//
//  ArticleV.swift
//  NewApp_SwiftUi
//
//  Created by 驱动新媒体 on 2022/7/12.
//

import Foundation
import SwiftUI


import Foundation

struct Article:Codable,Identifiable,Hashable {
    var id:String
    var title:String
    var mediaName:String
    var publishTime:String
    var content:String
}

extension Article {
    static func mock(id: String,title:String) -> Article{
        Article(id: id, title: title, mediaName: "来源：官方发布", publishTime: "2020-08-12 00:00:00", content: "")
    }
}


let testList=[Article.mock(id: "0", title: "SwiftUI 2 redacted新功能超实用的占位符功能(教程含源...)"),Article.mock(id: "0", title: "SwiftUI 3 redacted新功能超实用的占位符功能(教程含源...)"),Article.mock(id: "1", title: "SwiftUI 4 redacted新功能超实用的占位符功能(教程含源...)"),Article.mock(id: "2", title: "SwiftUI 5 redacted新功能超实用的占位符功能(教程含源...)"),Article.mock(id: "3", title: "SwiftUI 6 redacted新功能超实用的占位符功能(教程含源...)"),]

struct ArticleV:View
{
    
    var data:[Article]
    var body: some View
    {
        
        ForEach(data,id: \.self){ item in
            VStack(alignment: .leading){
                Text(item.title)
                    .font(Font.system(size: 16))
                    .foregroundColor(Color(.sRGB, red: 51/255, green: 51/255, blue: 51/255, opacity: 1))
                    .padding(.bottom, 8)
                HStack{
                    Text(item.mediaName)
                        .font(Font.system(size: 10))
                    Spacer()
                    Text(item.publishTime)
                        .font(Font.system(size: 10))
                }
                .foregroundColor(Color(.sRGB, red: 153/255, green: 153/255, blue: 153/255, opacity: 1))
            }
//            .redacted(reason: articleVM.listLoaded ? [] : .placeholder)
            
        }    .padding(.top)
            .padding(.horizontal)
        
    }
}
