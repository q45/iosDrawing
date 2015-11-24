//
//  ViewController.swift
//  Stack
//
//  Created by Quintin Smith on 11/11/15.
//  Copyright © 2015 wasatch code. All rights reserved.
//

import UIKit

class ShapeView: UIView {
    let size: CGFloat = 100.00
    
    init(origin: CGPoint) {
        super.init(frame: CGRectMake(0.0 , 0.0, size, size))
        self.center = origin
        self.backgroundColor = UIColor.clearColor()
    }
    
    //We need to implement init(coder) to avoid compilation errors
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func drawRect(rect: CGRect) {
        let path = UIBezierPath(roundedRect: rect, cornerRadius: 10)
        
        UIColor.grayColor().setFill()
        path.fill()
    }
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        
        
        let tapGR = UITapGestureRecognizer(target: self, action: "didTap:")
        self.view.addGestureRecognizer(tapGR)

//        let path = UIBezierPath()
//        
//        path.moveToPoint(CGPoint(x: 80, y: 50))
//        path.addLineToPoint(CGPoint(x: 140, y:150))
//        path.addLineToPoint(CGPoint(x: 10, y:150))
//        
//        path.closePath()
//        
//        UIColor.greenColor().setFill()
//        UIColor.redColor().setStroke()
//        path.lineWidth = 3.0
//        path.fill()
//        path.stroke()
        
    }
        
    @IBAction func didTapReset(sender: UIBarButtonItem) {
        print("Hello")
        view.subviews.forEach({ $0.removeFromSuperview()})
 
    }
    func didTap(tapGR: UITapGestureRecognizer) {
        
       let tapPoint = tapGR.locationInView(self.view)
        
        let shapeView = ShapeView(origin: tapPoint)
        
        self.view.addSubview(shapeView)
        
        let label = UILabel(frame: CGRectMake(0, 0, 50, 50))
        label.center = shapeView.center
        label.textAlignment = NSTextAlignment.Center
        label.textColor = UIColor.whiteColor()
        label.text = "Jimmy"
        
        self.view.addSubview(label)
    }
}

