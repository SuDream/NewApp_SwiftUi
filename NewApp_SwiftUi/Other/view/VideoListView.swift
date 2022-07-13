//
//  VideoListView.swift
//  NewApp_SwiftUi
//
//  Created by 驱动新媒体 on 2022/7/13.
//

import Foundation
import SwiftUI



struct VideoModel:Codable,Identifiable,Hashable {
    var id:String
    var title:String
    var duration:String
    var imgUrl:String
    var video:String //视频地址
    var desc:String //简介
}


extension VideoModel {
    static func mock(id: String,title:String) -> VideoModel{
        VideoModel(id: id, title: title, duration: "00:00:00", imgUrl: "", video: "", desc: "")
    }
}


struct VideoListView:View
{
    
    
    let testList=[VideoModel.mock(id: "1", title: "最伟大的作品最伟"),VideoModel.mock(id: "2", title: "最伟大的作品最伟大的作品最伟大的作品最伟大的作品最伟大的作品最伟大的作品最伟大的最伟大的作品最伟大的作品最伟大的作品最伟大的作品最伟大的作品最伟大的最伟大的作品最伟大的作品最伟大的作品最伟大的作品最伟大的作品最伟大的"),VideoModel.mock(id: "1", title: "世上的热闹"),VideoModel.mock(id: "1", title: "来自孤单"),VideoModel.mock(id: "1", title: "最伟大的作品")]
    var body : some View{
        
        ForEach(testList,id: \.self){ item in
            
            HStack(spacing:10)
            {
                videoImage(imageUrl: "banner3")
                
                VideoInfo(model: item)
            }.padding(.horizontal)
                .padding(.top)
//                .frame(height:56.25)
            
        }
        
    }
    
    
}


struct videoImage:View
{
    var imageUrl:String
    var body : some View
    {
      
        ZStack(alignment:.topLeading)
        {
            Image(imageUrl)
                .resizable()
                .aspectRatio(contentMode: .fill)
//                .scaleAspectFill()
              
                .frame(width: 100,height:56.25)
                
                    .background(Color.red)
                    .clipped()
            
//                            .clipShape(RoundedRectangle(cornerRadius: 5.0))
            Text("最热")
                .foregroundColor(.white)
                .font(.system(size: 11))
                .padding(2)
                .background(Color.red)
                .cornerRadius(5, corners: [.topLeft,.bottomRight])
            
            
        }
            .cornerRadius(5)
        
        
    }
}


struct VideoInfo:View
{
    var model:VideoModel
    
    var body : some View
    {
        VStack(alignment:.leading,spacing: 0){
            
            Text(model.title)
         
                .fixedSize(horizontal: false, vertical: true)
                .lineLimit(2)
                .font(Font.system(size: 12))
                .foregroundColor(Color(.sRGB, red: 51/255.0, green: 51/255.0, blue: 51/255.0, opacity: 1))
            
             
            Spacer()
            HStack{
                Text(Image(systemName: "video.circle"))+Text("视频课程")
                Spacer()
           
                Text(model.duration)
                
            } .font(Font.system(size: 10))
             .foregroundColor(Color(.sRGB, red: 153/255, green: 153/255, blue: 153/255, opacity: 1))
            
        }
    }
    
}


struct VideoListView_Priviews:PreviewProvider
{
    
    static var previews: some View {
        VideoListView()
    }
}
