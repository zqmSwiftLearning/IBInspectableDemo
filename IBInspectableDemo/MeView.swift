//
//  MeView.swift
//  IBInspectableDemo
//
//  Created by 张青明 on 15/8/5.
//  Copyright (c) 2015年 极客栈. All rights reserved.
//

import UIKit

@IBDesignable class MeView: UIView {

    var view:UIView!
    let xibName:String = "MeView"
    
    
    @IBOutlet weak var lblTitle: UILabel!
    
    @IBInspectable var title:String? {
        get {
            return self.lblTitle.text
        }
        
        set(title) {
            lblTitle.text = title
        }
//        didSet{
//            self.lblTitle.text = ""
//        }
    }

    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupUI()
    }
    
    
    func setupUI() {
        view = loadViewFromXib()
        view.frame = bounds
        addSubview(view)
    }
    
    
    func loadViewFromXib()->UIView {
        let bundle = NSBundle(forClass: self.dynamicType)
        
        let nib = UINib(nibName: xibName, bundle: bundle)
        let view = nib.instantiateWithOwner(self, options: nil)[0] as! UIView
        
        
        return view
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
}
