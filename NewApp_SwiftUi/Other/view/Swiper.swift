//
//  Swiper.swift
//  NewApp_SwiftUi
//
//  Created by 驱动新媒体 on 2022/7/12.
//

import Foundation
import SwiftUI

struct Swiper<SwiperItem:View>:UIViewControllerRepresentable
{
   
    
    typealias UIViewControllerType = UIPageViewController
    
    
    @Binding private var currentPage:Int
    private var items:[SwiperItem]
    
    init(items:[SwiperItem],currentPage:Binding<Int>) {
        self.items = items
        self._currentPage = currentPage
    }
    
    //初始化对象
    func makeUIViewController(context: Context) -> UIPageViewController {
        
        let pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        pageViewController.dataSource = context.coordinator
        pageViewController.delegate = context.coordinator
        pageViewController.view.backgroundColor = .blue
        
//        pageViewController.view.frame = CGRect(origin: .zero, size: CGSize(width: 428.0, height: 170.0))
        return pageViewController
    }
    
    //状态发生改变
    func updateUIViewController(_ uiViewController: UIPageViewController, context: Context) {
        uiViewController.setViewControllers([context.coordinator.controllers[currentPage]], direction: .forward, animated: true, completion: nil)
    }
    
    
    //生成代理对象
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    
    class Coordinator: NSObject,UIPageViewControllerDataSource,UIPageViewControllerDelegate {
        private var parent:Swiper
        var controllers = [UIViewController]()
        init(_ parent:Swiper) {
            self.parent = parent
            controllers = parent.items.map({
                let hostingController = UIHostingController(rootView: $0)
//                hostingController.view.frame = CGRect(origin: .zero, size: CGSize(width: 428.0, height: 170.0))
                hostingController.view.backgroundColor = UIColor(red: CGFloat(Float.random(in: 0...1)), green: CGFloat(Float.random(in: 0...1)), blue: CGFloat(Float.random(in: 0...1)), alpha: 1)
                return hostingController
            })
        }
        
        
        func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
            guard let index = controllers.firstIndex(of: viewController) else {
                return nil
            }
            
            if index == 0 {
                return controllers.last
            }
            
            return controllers[index - 1]
        }
        
        func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
            guard let index = controllers.firstIndex(of: viewController) else {
                return nil
            }
            
            
            if index == controllers.count - 1 {
                return controllers.first
            }
            
            return controllers[index + 1]
        }
        
        func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
            
            
            
            if completed,let visiableController = pageViewController.viewControllers?.first,let index = controllers.firstIndex(of: visiableController) {
                parent.currentPage = index
            }
        }
        
        
    }
    
    
}
