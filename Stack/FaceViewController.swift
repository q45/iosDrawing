//
//  FaceViewController.swift
//  Stack
//
//  Created by Quintin Smith on 11/20/15.
//  Copyright © 2015 wasatch code. All rights reserved.
//

import UIKit

class FaceViewController: UIViewController, FaceViewDataSource {
    
    
    @IBOutlet weak var faceView: FaceView! {
        didSet {
            faceView.dataSource = self
            faceView.addGestureRecognizer(UIPinchGestureRecognizer(target: faceView, action: "scale:" ))
        }
    }
    
    private struct Constants {
        static let HappinessGestureScale: CGFloat = 5
    }
    @IBAction func changeHappiness(gesture: UIPanGestureRecognizer) {
        switch gesture.state {
        case .Ended: fallthrough
        case .Changed:
            let translation = gesture.translationInView(faceView)
            let happinessChanged = Int(translation.y / Constants.HappinessGestureScale)
            if happinessChanged != 0 {
                happiness += happinessChanged
                gesture.setTranslation(CGPointZero, inView: faceView)
            }
        default:
            break
        }
    }
    
    var happiness: Int = 10 { //Zero is sad 100 = ecstatic
        didSet {
            happiness = min(max(happiness, 0), 100)
            print("Happiness = \(happiness)")
            updateUI()
        }
    }
    
    private func updateUI() {
        faceView.setNeedsDisplay()
    }
    
    func smilinessForFaceView(sender: FaceView) -> Double? {
        return Double(happiness-50)/50
    }

}
