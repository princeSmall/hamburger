# hamburger

<image height = 600 width = 350 src = "./image/san.png">

<image height = 600 width = 350 src = "./image/hong.png">


1. Pod pop 如 [Swift_popAnimation初级]

###  动画思路
<pre>
   三条杠变叉：中间杠的消失和两边杠的偏移。
   叉变三条杠：两边杠的偏移和中间杠的出现。
</pre>

1. 三条杠用三个view来代替，添加在一个button上。声明全局属性
<pre>
    var  hamburger = true
    var  hamburgerButton : UIButton?
    var  top:UIView?
    var  middle:UIView?
    var  bottom:UIView?
</pre>

2. 实例化对象

        self.hamburgerButton = UIButton()
        self.hamburgerButton?.backgroundColor = UIColor.black
        self.hamburgerButton?.frame = CGRect(x: 100, y: 200, width: 150, height: 150)     
        self.hamburgerButton?.layer.cornerRadius = 75
        self.view.addSubview(hamburgerButton!)
        self.hamburgerButton?.addTarget(self, action:#selector(didTapHamburgerButton), for: UIControlEvents.touchUpInside)
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
        
### pop对象复用

1. 颜色动画：
<pre>
        var topColor = self.top?.pop_animation(forKey: "topColor") as! POPSpringAnimation?
        var bottomColor = self.top?.pop_animation(forKey: "bottomColor") as! POPSpringAnimation?
</pre>
2. 旋转动画：
<pre>
        var topRotate = self.top?.layer.pop_animation(forKey: "topRotate") as! POPSpringAnimation?
        var bottomRotate = self.top?.layer.pop_animation(forKey: "bottomRotate") as! POPSpringAnimation?
</pre>
3. 位置动画：
<pre>
        var topPosition = self.top?.layer.pop_animation(forKey: "topPosition")as!POPSpringAnimation?
        var bottomPosition = self.top?.layer.pop_animation(forKey: "bottomPosition")as!POPSpringAnimation?
</pre>

### 三道杠变红叉叉
<pre>
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
            
}
</pre>

### 红叉叉变三道杠:逆向->就还原一起改变值
<pre>
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
</pre>
