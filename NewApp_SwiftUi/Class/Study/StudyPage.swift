//
//  StudyPage.swift
//  NewApp_SwiftUi
//
//  Created by 驱动新媒体 on 2022/7/7.
//

import SwiftUI

struct StudyPage: View {
    
    //轮播图index
    @State var currentPage:Int = 0
    
    //0 咨询 1 视频
    @State var ishowArticleZX:Int=0
    
    var body: some View {
        VStack(spacing:0){
            AppBar {
                Image("tool_bar_left_icon")
                    .resizable()
                    .frame(width: 69, height: 25)
                
                HStack{
                    Image(systemName: "magnifyingglass")
                    Text("搜索感兴趣的内容")
                    Spacer()
                }
                .padding(.horizontal,12.0)
                .padding(.vertical,8.0)
                .background(Color.white.opacity(0.2))
                .cornerRadius(25)
                
                Text("学习\n进度")
                    .font(.system(size: 12))
                Text("26%")
                Image(systemName: "bell")
                
                //
                //                .clipShape(RoundedRectangle(cornerRadius:25))
                
            }
            SDTabbarView(itemsString:["我是分类1","我是分类2","我是分类3","我是分类4","我是分类5"])
                .frame(height:55)
            
            
            ScrollView{
                
                LazyVStack(spacing:0)
                {
                    SDTabbarView(showIndicator:false,itemsImage:[TabbarItem(index: 0, text: "相关咨询",image: "study_icon"),TabbarItem(index: 1, text: "视频课程",image: "task_icon")],selection: $ishowArticleZX)
                        .frame(height:55)
                    SwiperView(items: [
                        Image("banner1").resizable(),
                        Image("banner2").resizable(),
                        Image("banner3").resizable(),
                        Image("banner4").resizable()
                    ], currentPage: $currentPage)
                    .cornerRadius(12)
                    .padding(.horizontal)
                    
                    if ishowArticleZX == 0
                    {
                        ArticleV(data: testList)
                    }else
                    {
                      VideoListView()
                            .padding(.top)
                        
                    }
                    
                }
                
            }
 
            Spacer()
        }
        
    }
    
    
    
    
}


struct StudyPage_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            StudyPage()
    
        }
    }
}
