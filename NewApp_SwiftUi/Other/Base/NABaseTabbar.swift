//
//  SwiftUIView.swift
//  NewApp_SwiftUi
//
//  Created by 驱动新媒体 on 2022/7/7.
//

import SwiftUI

struct NABaseTabbar: View {
    init(){
        //        InitAppearance()
        
    }
    @State var selectIndex=0
    var body: some View {
        
        
        NavigationView{
            
            TabView(selection: $selectIndex)
            {
                StudyPage()
                    .tabItem {
                        
                        //                        Image(selectIndex == 0 ?  "选中的样式":"未选中的样式")
                        Image("study_icon")
                        Text("学习")
                    }.tag(0)
                    .ignoresSafeArea(edges: .top)
                TaskPage()
                    .tabItem {
                        Image("task_icon")
                        Text("任务")
                    }.tag(1)
                    .ignoresSafeArea(edges: .top)
                ProfilePage()
                    .tabItem {
                        Image("mine_icon")
                        Text("我的")
                        
                        
                    }.tag(2)
                    .ignoresSafeArea(edges: .top)
                
            }.accentColor(.red)
            
            
        }.navigationBarTitleDisplayMode(.inline)
    }
    
    
    
    
    
    
    struct NABaseTabbar_Previews: PreviewProvider {
        static var previews: some View {
            NABaseTabbar()
        }
    }
}
