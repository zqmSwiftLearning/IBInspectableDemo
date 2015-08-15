//
//  RatingBarView.swift
//  IBInspectableDemo
//
//  Created by 张青明 on 15/8/5.
//  Copyright (c) 2015年 极客栈. All rights reserved.
//
//  评分条


import UIKit


/// 评分条
@IBDesignable class RatingBarView: UIView {
    
    /// 评分星星默认图
    @IBOutlet weak var ivBorder: UIImageView!
    /// 评分星星高亮图
    @IBOutlet weak var ivFilled: UIImageView!
    
    @IBOutlet weak var starFilledWidth: NSLayoutConstraint!
    
    @IBOutlet var tapGesture: UITapGestureRecognizer!
    
    @IBAction func selectedStarNumber(sender: UITapGestureRecognizer) {
        
        print("\(__FUNCTION__)\n\n")
    }
    var view:UIView!

    @IBInspectable var rating:CGFloat = 0.0 {
        
        didSet {
            let w = bounds.size.width/5
            var everyStartW:CGFloat = w
            print("w:\(w)\n\n\n\n")
            var starCout            = Int(rating)
            var starMore:CGFloat    = 12.0*(rating-CGFloat(starCout))
            var starW:CGFloat       = CGFloat(starCout) * everyStartW + 2.5 + starMore
            
            starFilledWidth.constant = starW
            
        }
    }
    
    
    @IBInspectable var borderImage:UIImage? {
        get{
            return self.ivBorder.image
        }
        set(image) {
            self.ivBorder.image = image
            print("\(image!)\n")
        }
    }
    @IBInspectable var filledImage:UIImage? {
        get{
            return self.ivFilled.image
        }
        set(image) {
            self.ivFilled.image = image
            print("\(image!)\n")
        }
    }
    
//    @IBInspectable var cco:UIColor? {
//        get {
//            return self.backgroundColor
//        }
//        set(color) {
//            self.backgroundColor = color
//        }
//    }
    
//    override func awakeFromNib() {
//        self.autoresizingMask = UIViewAutoresizing.None
//    }

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupUI()
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setupUI()
    }
    
    #if true
    
    func setupUI() {
        self.view       = loadViewFromNib()
        self.view.frame = self.bounds
        self.ivFilled.clipsToBounds = true
//        self.ivFilled.layer.masksToBounds = true
//        self.starFilledWidth.constant = 50
       
        self.view.autoresizingMask = UIViewAutoresizing.FlexibleWidth | UIViewAutoresizing.FlexibleHeight
        self.addSubview(self.view)
        
    }
    
    
    
    
    func loadViewFromNib() -> UIView {
        let bundle = NSBundle(forClass: self.dynamicType)
        let nib    = UINib(nibName: "RatingBarView", bundle: bundle)

//        bundle.loadNibNamed("RatingBarView", owner: self, options: nil).first
        
        let view = nib.instantiateWithOwner(self, options: nil).first as! UIView

//        let view = NSBundle.mainBundle().loadNibNamed("RatingBarView", owner: nil, options: nil).first as! UIView
//        let view = bundle.loadNibNamed("RatingBarView", owner: self, options: nil).first as! UIView
        return view
    }
    #endif
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
