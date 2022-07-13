//
//  SDTabbarView.swift
//  NewApp_SwiftUi
//
//  Created by 驱动新媒体 on 2022/7/11.
//

import SwiftUI


struct TabbarItem:Identifiable {
    var id = UUID()
    var index:Int
    var text:String
    var image:String?
}





struct SDTabbarView: View {
    
    var isScrollable:Bool = true
    var showIndicator:Bool = true
    //不带图片的数据源
    var itemsString:[String]?
    
    //带图片的数据源
    var itemsImage:[TabbarItem]?
    var selection: Binding<Int>?
    
    private var items:[TabbarItem]
     {
         var index = -1
        
         if (itemsString?.count ?? 0) > 0
         {
             return itemsString?.map { str in
                  index+=1
                  return TabbarItem(index: index, text: str)
              } ??  []
              
         }else if (itemsImage?.count ?? 0) > 0
         {

             return itemsImage ?? []
         }else
         {
             return []
         }
         
         
       
         
     }
    
    var body : some View
    {
        GeometryReader{ reader in
            if isScrollable {
                ScrollView(.horizontal,showsIndicators:false) {
                    ScrollViewReader{proxy in
                        SDTabbarSubV(proxy:proxy, items: items,showIndicator:showIndicator,width:reader.size.width,height: reader.size.height,selection: selection)
                    }
                }
            } else {
                SDTabbarSubV(items: items,showIndicator:showIndicator,width:reader.size.width,height: reader.size.height,selection: selection)
            }
            
        }
        .background((itemsImage?.count ?? 0) > 0  ? Color.clear:Color(.sRGB, red: 20/255.0, green: 158/255.0, blue: 231/255.0, opacity: 0.1))
        
        

        
    }
    
}


struct SDTabbarSubV:View{
    
    var proxy:ScrollViewProxy?
    
     var items:[TabbarItem]

    

    private let indicatorHeight:CGFloat = 2
    var showIndicator:Bool = true

    var width:CGFloat
    var height:CGFloat
    var selection: Binding<Int>?
    var itemWidth:CGFloat
    {
        if items.count > 4
        {
            return width/4
        }else
        {
            return width/CGFloat(items.count)
        }
    }
    private var itemHeight: CGFloat {
        if height < indicatorHeight {
            return indicatorHeight
        }
        return height - indicatorHeight
    }
    
    @State private var selectedIndex = 0
    
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 0, content: {
            
            HStack(spacing:0)
            {
             
                ForEach(items){ item in
                    HStack(alignment:.center,spacing:0)
                    {
                    
                        if let _ = item.image
                        {
                            Image(item.image!)
                        }
                   
                        Text(item.text)
                            .foregroundColor(selectedIndex == item.index ? Color(.sRGB, red: 20/255.0, green: 158/255.0, blue: 231/255.0, opacity: 1) : Color(.sRGB, red: 102/255.0, green: 102/255.0, blue: 102/255.0, opacity: 1))
                       
                            
                            .onTapGesture {
                                selectedIndex = item.index
                                selection?.wrappedValue = item.index
                                //计算剩余可滚动宽度
                                let surplusW = (CGFloat(items.count) - CGFloat(selectedIndex)) * itemWidth
                                let halfOfWidth = width / 2
                                
                                withAnimation {
                                    if halfOfWidth >= surplusW {
                                        proxy?.scrollTo(item.id,anchor:.trailing)
                                    } else {
                                        proxy?.scrollTo(item.id,anchor: .center)
                                    }
                                }
                                
                            }.id(item.id)
                         
                            .frame( height: itemHeight)
                          
                    } .frame(width: itemWidth,height: itemHeight)
                   
              
                }
            }
            
            if showIndicator
            {
              
                Divider()
                    .frame(width: itemWidth,height: indicatorHeight)
                    .background(Color(.sRGB, red: 20/255.0, green: 158/255.0, blue: 231/255.0, opacity: 1))
                    .offset(x: CGFloat(selectedIndex) * itemWidth)
                    .animation(.easeInOut(duration: 0.2))
            }
            
            
        }).onAppear{
            selectedIndex = selection?.wrappedValue ?? 0
        }
        
    }
}

//struct SDTabbarView_Previews: PreviewProvider {
//    static var previews: some View {
//        SDTabbarView(itemsString: ["我是分类1","我是分类2","我是分类3","我是分类4","我是分类5"])
//    }
//}
