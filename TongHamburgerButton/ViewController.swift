//
//  ViewController.swift
//  TongHamburgerButton
//
//  Created by tongle on 2017/6/9.
//  Copyright © 2017年 tong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //状态
    var hamburger = true
    var hamburgerButton : UIButton?
    var top:UIView?
    var  middle:UIView?
    var  bottom:UIView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //实例化按钮
        self.hamburgerButton = UIButton()
        self.hamburgerButton?.backgroundColor = UIColor.black
        self.hamburgerButton?.frame = CGRect(x: 100, y: 200, width: 150, height: 150)
        
        self.hamburgerButton?.layer.cornerRadius = 75
        self.view.addSubview(hamburgerButton!)
        self.hamburgerButton?.addTarget(self, action:#selector(ViewController.didTapHamburgerButton as (ViewController) -> () -> ()), for: UIControlEvents.touchUpInside)
        //三道杠
        let sectionWidth:CGFloat = 80.0
        let sectionHeight:CGFloat = 11.0
        //top
        top = UIView(frame: CGRect(x: (self.hamburgerButton?.bounds.size.width)! / 2 - sectionWidth / 2, y: 40, width: sectionWidth, height: sectionHeight))
        top?.backgroundColor = UIColor.white
        top?.isUserInteractionEnabled = false
        top?.layer.cornerRadius = sectionHeight / 2
        self.hamburgerButton?.addSubview(top!)
        //middle
        middle = UIView(frame: CGRect(x: (self.hamburgerButton?.bounds.size.width)! / 2 - sectionWidth / 2, y: 69, width: sectionWidth, height: sectionHeight))
        middle?.backgroundColor = UIColor.white
        middle?.isUserInteractionEnabled = false
        middle?.layer.cornerRadius = sectionHeight / 2
        self.hamburgerButton?.addSubview(middle!)
        //bottom
        bottom = UIView(frame: CGRect(x: (self.hamburgerButton?.bounds.size.width)! / 2 - sectionWidth / 2, y: 99, width: sectionWidth, height: sectionHeight))
        bottom?.backgroundColor = UIColor.white
        bottom?.isUserInteractionEnabled = false
        bottom?.layer.cornerRadius = sectionHeight / 2
        self.hamburgerButton?.addSubview(bottom!)
        
        

        // Do any additional setup after loading the view, typically from a nib.
    }
    func didTapHamburgerButton()  {
        //所有pop对象的复用实例
        //颜色动画
        var topColor = self.top?.pop_animation(forKey: "topColor") as! POPSpringAnimation?
        var bottomColor = self.top?.pop_animation(forKey: "bottomColor") as! POPSpringAnimation?
        
        //旋转动画
        var topRotate = self.top?.layer.pop_animation(forKey: "topRotate") as! POPSpringAnimation?
        var bottomRotate = self.top?.layer.pop_animation(forKey: "bottomRotate") as! POPSpringAnimation?
        
        //位置：Y坐标动画
        var topPosition = self.top?.layer.pop_animation(forKey: "topPosition")as!POPSpringAnimation?
        var bottomPosition = self.top?.layer.pop_animation(forKey: "bottomPosition")as!POPSpringAnimation?
        
        if hamburger {
            //三道杠变红叉叉
            hamburger = false
            UIView.animate(withDuration: 0.2, animations: {
                self.middle?.alpha = 0
            })
            //变色
            if topColor != nil {
                topColor?.toValue = UIColor.red
            }else{
                topColor = POPSpringAnimation(propertyNamed: kPOPViewBackgroundColor)
                topColor?.toValue = UIColor.red
                topColor?.springBounciness = 0
                topColor?.springSpeed = 18
                top?.pop_add(topColor, forKey: "topColor")
            }
            if bottomColor != nil {
                bottomColor?.toValue = UIColor.red
            }else{
                bottomColor = POPSpringAnimation(propertyNamed: kPOPViewBackgroundColor)
                bottomColor?.toValue = UIColor.red
                bottomColor?.springBounciness = 0
                bottomColor?.springSpeed = 18
                bottom?.pop_add(topColor, forKey: "bottomColor")
            }
            //旋转
            if topRotate != nil {
                topRotate?.toValue = -Double.pi / 4
            }else{
                topRotate = POPSpringAnimation(propertyNamed: kPOPLayerRotation)
                topRotate?.toValue = -Double.pi / 4
                topRotate?.springBounciness = 11
                topRotate?.springSpeed = 18
                top?.layer.pop_add(topRotate, forKey: "topRotate")
            }
            if bottomRotate != nil {
                bottomRotate?.toValue = Double.pi / 4
            }else{
                bottomRotate = POPSpringAnimation(propertyNamed: kPOPLayerRotation)
                bottomRotate?.toValue = Double.pi / 4
                bottomRotate?.springBounciness = 11
                bottomRotate?.springSpeed = 18
                bottom?.layer.pop_add(bottomRotate, forKey: "bottomRotate")
            }
            //移动
            if topPosition != nil {
                topPosition?.toValue = 29
            }else{
                topPosition = POPSpringAnimation(propertyNamed: kPOPLayerTranslationY)
                topPosition?.toValue = 29
                topPosition?.springBounciness = 11
                topPosition?.springSpeed = 18
                top?.layer.pop_add(topPosition, forKey: "topPosition")
            }
            if bottomPosition != nil {
                bottomPosition?.toValue = -29
            }else{
                bottomPosition = POPSpringAnimation(propertyNamed: kPOPLayerTranslationY)
                bottomPosition?.toValue = -29
                bottomPosition?.springBounciness = 11
                bottomPosition?.springSpeed = 18
                bottom?.layer.pop_add(bottomPosition, forKey: "bottomPosition")
            }
            
            
            
        }else{
            //红叉叉变三道杠:逆向->就还原一起改变值
            hamburger = true
            UIView.animate(withDuration: 0.2, animations: {
                self.middle?.alpha = 1
            })
            //变色
            if topColor != nil {
                topColor?.toValue = UIColor.white
            }else{
                topColor = POPSpringAnimation(propertyNamed: kPOPViewBackgroundColor)
                topColor?.toValue = UIColor.white
                topColor?.springBounciness = 0
                topColor?.springSpeed = 18
                top?.pop_add(topColor, forKey: "topColor")
            }
            if bottomColor != nil {
                bottomColor?.toValue = UIColor.white
            }else{
                bottomColor = POPSpringAnimation(propertyNamed: kPOPViewBackgroundColor)
                bottomColor?.toValue = UIColor.white
                bottomColor?.springBounciness = 0
                bottomColor?.springSpeed = 18
                bottom?.pop_add(topColor, forKey: "bottomColor")
            }
            //旋转
            if topRotate != nil {
                topRotate?.toValue = 0
            }else{
                topRotate = POPSpringAnimation(propertyNamed: kPOPLayerRotation)
                topRotate?.toValue = 0
                topRotate?.springBounciness = 11
                topRotate?.springSpeed = 18
                top?.layer.pop_add(topRotate, forKey: "topRotate")
            }
            if bottomRotate != nil {
                bottomRotate?.toValue = 0
            }else{
                bottomRotate = POPSpringAnimation(propertyNamed: kPOPLayerRotation)
                bottomRotate?.toValue = 0
                bottomRotate?.springBounciness = 11
                bottomRotate?.springSpeed = 18
                bottom?.layer.pop_add(bottomRotate, forKey: "bottomRotate")
            }
            //移动
            if topPosition != nil {
                topPosition?.toValue = 0
            }else{
                topPosition = POPSpringAnimation(propertyNamed: kPOPLayerTranslationY)
                topPosition?.toValue = 0
                topPosition?.springBounciness = 11
                topPosition?.springSpeed = 18
                top?.layer.pop_add(topPosition, forKey: "topPosition")
            }
            if bottomPosition != nil {
                bottomPosition?.toValue = 0
            }else{
                bottomPosition = POPSpringAnimation(propertyNamed: kPOPLayerTranslationY)
                bottomPosition?.toValue = 0
                bottomPosition?.springBounciness = 11
                bottomPosition?.springSpeed = 18
                bottom?.layer.pop_add(bottomPosition, forKey: "bottomPosition")
            }
            
            
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

