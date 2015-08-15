//
//  MyView.swift
//  IBInspectableDemo
//
//  Created by 张青明 on 15/8/5.
//  Copyright (c) 2015年 极客栈. All rights reserved.
//

import UIKit

@IBDesignable class MyView: UIView {

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    
    @IBInspectable var cornerRadius:CGFloat = 0.0 {
        didSet {
            layer.cornerRadius = cornerRadius
        }
    }
    @IBInspectable var backColor:UIColor = UIColor.clearColor() {
        didSet {
            backgroundColor = backColor
        }
    }
    
    @IBInspectable var borderColor:UIColor = UIColor.clearColor() {
        didSet {
            layer.borderColor = borderColor.CGColor
        }
    }
    
    @IBInspectable var borderWidth:CGFloat = 0.0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    

}
