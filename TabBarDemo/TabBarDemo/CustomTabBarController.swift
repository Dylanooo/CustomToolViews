//
//  CustomTabBarController.swift
//  TabBarDemo
//
//  Created by Dylan on 16/5/5.
//  Copyright © 2016年 Dylan.Lee. All rights reserved.
//

import UIKit

class CustomTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
      tabBar.removeFromSuperview()

      let customBar = CustomTabBarView(frame: CGRect(x: 0, y: screenHeight - 50, width: screenWidth, height: 50), controllers: viewControllers!, normalImgs: ["zhibo_03", "zhibo_03", "zhibo_03"], selectedImgs: ["zhibo_05", "zhibo_05", "zhibo_05"])
      customBar.delegate = self
      view.addSubview(customBar)

      
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}

extension CustomTabBarController: CustomTabBarViewDelegate {
  func itemClicked(index: Int) {
    selectedIndex = index
  }
}