//
//  RatingBar.swift
//  IBInspectableDemo
//
//  Created by 张青明 on 15/8/7.
//  Copyright (c) 2015年 极客栈. All rights reserved.
//
//  RatingBar
//  评星条

import UIKit
let xibName = "RatingBar"

/// 评星条：长：110 X 宽：22
@IBDesignable class RatingBar: UIView {


    // 手势事件：计算星星数量
    @IBAction func changeStarNumber(sender: UITapGestureRecognizer) {
        if isSelected == false
        {
            return
        }
        
        let tapPoint = sender.locationInView(self)
        let offset = tapPoint.x
        //通过x坐标判断
        let realRatingScore = offset / (self.bounds.size.width / starsTotalNumber)
        
        self.currentRating = round(realRatingScore+0.5)
    }
    @IBOutlet weak var starHWidth: NSLayoutConstraint!

    @IBOutlet weak var ivBackground: UIImageView!
    
    @IBOutlet weak var ivForeground: UIImageView!
    var vv:UIView!
    @IBInspectable var starsTotalNumber:CGFloat     = 5
    @IBInspectable var currentRating   :CGFloat = 0.0 {
        didSet {

            if currentRating < 0.0
            {
                currentRating = 0.0
            }
            else if currentRating > 5.0
            {
                currentRating = 5.0
            }
            
            let w = bounds.size.width/5
            var everyStartW:CGFloat = w
            
            var starCout            = Int(currentRating)
            var starMore:CGFloat    = 12.0*(currentRating-CGFloat(starCout))
            var starW:CGFloat       = CGFloat(starCout) * everyStartW + 5.0 + starMore
            
            self.starHWidth.constant = starW
            
        }
    }
    
    /// 未选中时的star图片
//    @IBInspectable var normalStarImage  : UIImage = UIImage(named: "star_gray")!
    @IBInspectable var normalStarImage  : UIImage? {
        get{
            return self.ivBackground.image
        }
        set(image){
            self.ivBackground.image = image
        }
    }
    /// 被选中时的star图片
//    @IBInspectable var selectedStarImage: UIImage = UIImage(named: "starH")!
    @IBInspectable var selectedStarImage: UIImage? {
        get{
            return self.ivForeground.image
        }
        set(image){
            self.ivForeground.image = image
        }
    }
    
    @IBInspectable var isSelected:Bool = false
    
//    var backgroundView: UIView!
//    var foregroundView: UIView!
    
    override func awakeFromNib() {
        self.autoresizingMask = UIViewAutoresizing.None
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupUI()
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setupUI()
    }
    
    func setupUI() {
        self.vv       = loadViewFromXib()
//        self.vv.autoresizingMask = UIViewAutoresizing.None
        self.vv.frame = self.bounds
        
        self.addSubview(self.vv)
    }
    
    func loadViewFromXib()-> UIView {
        // TODO:
        let bundler        = NSBundle(forClass: self.dynamicType)
        let xib            = UINib(nibName: xibName, bundle: bundler)
        let viewFormXib    = xib.instantiateWithOwner(self, options: nil).first as! UIView
        return viewFormXib
    }

}
