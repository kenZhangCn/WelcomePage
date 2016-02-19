//
//  ViewController.swift
//  WelcomePageForSwiftWeather
//
//  Created by k&r on 16/1/31.
//  Copyright © 2016年 k&r. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIScrollViewDelegate {

  var scrollView = UIScrollView()
  var littleSpot = UIPageControl()  //声明一个小圆点
  var btn = UIButton()  //声明一个按钮
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    
    //配置小圆点
    littleSpot.center = CGPointMake(self.view.frame.width/2, self.view.frame.height-30)
    littleSpot.currentPageIndicatorTintColor = UIColor.whiteColor() //当前页面指针颜色
    littleSpot.pageIndicatorTintColor = UIColor.lightGrayColor()  //滑动页面时的颜色
    littleSpot.numberOfPages = 4 //4个小圆点
    littleSpot.addTarget(self, action: "scrollViewDidEndDecelerating", forControlEvents: UIControlEvents.ValueChanged) //连同scrollView一起滚动
    
    //配置启动页属性
    scrollView.frame = self.view.bounds             //勾勒scrollView轮廓
    scrollView.contentSize = CGSizeMake(4*scrollView.frame.width, 0) //横行滚动，宽度设为四倍，高度为0 //源码4*self.view.frame.width
    scrollView.pagingEnabled = true
    scrollView.bounces = false  //拉住反弹效果false
    scrollView.showsHorizontalScrollIndicator = false  //水平方向滚动条false
    scrollView.delegate = self  //让代理等于自身
    self.view.addSubview(scrollView)   //添加子视图，把scrollView添加到view
    //添加图片
    for var i=0;i<4;i++ {
      let image = UIImage(named: "Welcome\(i+1)")
      let imageView = UIImageView(frame: CGRectMake(0, 0, scrollView.frame.width, scrollView.frame.height)) //添加一个ImageView存放image
      imageView.image = image
      //滚动实现
      var frame = imageView.frame
      frame.origin.x = CGFloat(i)*frame.size.width //横坐标随着滚动变化
      imageView.frame = frame
      scrollView.addSubview(imageView)
      self.view.addSubview(littleSpot)   //把小圆点添加到视图
    }
  }
  
  //UIScrollView重载方法,滑出一页时执行的方法
  func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
    var index = Int(scrollView.contentOffset.x/self.view.frame.size.width) //获取index
    littleSpot.currentPage = index
    //把按钮添加到第四个图片上
    if (index == 3) {
      self.btn.frame = CGRectMake(3*self.view.frame.width, self.view.frame.height, self.view.frame.width, 50)
      self.btn.layer.cornerRadius = 5  //绘制圆角
      self.btn.setTitle("蓉蓉,今天出太阳", forState: UIControlState.Normal)
      self.btn.titleLabel?.font = UIFont.systemFontOfSize(20) //设置文本字体大小
      self.btn.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Highlighted) //设置文本标题颜色,点击时变成灰色
      self.btn.backgroundColor = UIColor.cyanColor()  //背景颜色
      self.btn.addTarget(self, action: "buttonClick:", forControlEvents: UIControlEvents.TouchUpInside) //添加点击按钮事件响应
      //渐变效果
      self.btn.alpha = 0 // 透明度为0
      UIView.animateWithDuration(1.3, delay: 0.2, options: UIViewAnimationOptions.CurveEaseInOut, animations: { () -> Void in
        self.btn.frame = CGRectMake(3*self.view.frame.width+100, self.view.frame.height-150, self.view.frame.width-200, 50)
        self.btn.alpha = 0.5
        scrollView.addSubview(self.btn)  //把按钮添加到scrollView，如果添加到imageView会无法点击
        }, completion: nil)
    }
  }
  
  //按钮跳转主界面方法
  func buttonClick(button: UIButton) {
    let sb = UIStoryboard(name: "Main", bundle: nil) //获取了Main storyboard，才能获取storyboard下的second以ID的ViewControllor
    let second = sb.instantiateViewControllerWithIdentifier("second") as! UIViewController //强制转换为UIViewController
    self.presentViewController(second, animated: true, completion: nil)  //跳转
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

