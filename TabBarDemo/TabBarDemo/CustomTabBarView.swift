//
//  CustomTabBarView.swift
//  TabBarDemo
//
//  Created by Dylan on 16/5/5.
//  Copyright © 2016年 Dylan.Lee. All rights reserved.
//

import UIKit
let screenWidth = UIScreen.mainScreen().bounds.size.width
let screenHeight = UIScreen.mainScreen().bounds.size.height

protocol CustomTabBarViewDelegate: class {
  func itemClicked(index: Int)
  
}


class CustomTabBarView: UIView {

  weak var delegate: CustomTabBarViewDelegate?
  
  var viewControllers = [UIViewController]()
  var normalIcons = [String]()
  var selectedIcons = [String]()
  var selectedItem: UIButton?
  init(frame: CGRect, controllers: [UIViewController], normalImgs: [String], selectedImgs: [String]) {
    super.init(frame: frame)
    assert(normalImgs.count == controllers.count, "图片个数要与控制器个数相等")
    assert(selectedImgs.count == controllers.count, "图片个数要与控制器个数相等")
    viewControllers = controllers
    normalIcons = normalImgs
    selectedIcons = selectedImgs
    backgroundColor = UIColor.whiteColor()
    setupItems()
  }
  
  func setupItems() {
    for index in 0 ..< viewControllers.count {
      let item = UIButton(type: .Custom)
      item.frame = CGRect(x: index * (screenWidth / viewControllers.count), y: 8, width: screenWidth / viewControllers.count, height: frame.height - 16)
      item.tag = 60000 + index
      item.setTitle("\(index)", forState: .Normal)
      item.setTitle("\(index)", forState: .Selected)
      item.titleLabel?.font = UIFont.systemFontOfSize(14)
      let selectedImg = UIImage(named: selectedIcons[index])
      let normalImg   = UIImage(named: normalIcons[index])
      item.setImage(normalImg, forState: .Normal)
      item.setImage(selectedImg, forState: .Selected)
      item.imageEdgeInsets = UIEdgeInsetsMake(-item.titleLabel!.intrinsicContentSize().height, 0, 0, -item.titleLabel!.intrinsicContentSize().width)
      item.titleEdgeInsets = UIEdgeInsetsMake(4, -item.imageView!.frame.size.width, -item.imageView!.frame.size.height, 0)
      item.setTitleColor(UIColor.redColor(), forState: .Selected)
      item.setTitleColor(UIColor.blackColor(), forState: .Normal)
      item.addTarget(self, action: #selector(itemClicked), forControlEvents: .TouchUpInside)
      if index == 0 {
        selectedItem = item
        selectedItem?.selected = true
      }
      addSubview(item)
    }
  }
  
  func itemClicked(sender: UIButton) {
    selectedItem?.selected = false
    selectedItem = sender
    selectedItem?.selected = true
    delegate?.itemClicked(sender.tag - 60000)
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

}
