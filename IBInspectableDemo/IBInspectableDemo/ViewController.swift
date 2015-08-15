//
//  ViewController.swift
//  IBInspectableDemo
//
//  Created by 张青明 on 15/8/5.
//  Copyright (c) 2015年 极客栈. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var ratingBar: RatingBar!
    @IBOutlet weak var ratingBarView: RatingBarView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        ratingBarView.rating = 2.8
//        ratingBar.currentRating = 1.1
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

//    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
//        ratingBar.currentRating += 0.1
//    }

}

