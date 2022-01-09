//
//  ViewController.swift
//  WorldTrotter
//
//  Created by Jessica  Duell on 1/9/22.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setGradientBackground()
    }
    
    func setGradientBackground(){
        let gradientLayer = CAGradientLayer()
        
        let grey2 = UIColor.Custom.Grey.DarkGrey.cgColor
        let grey = UIColor.Custom.Grey.Grey
        
        gradientLayer.colors = [grey2, grey]
        gradientLayer.startPoint = CGPoint(x:0.5, y:1.0)
        gradientLayer.endPoint = CGPoint(x:0.5, y:0.0)
        gradientLayer.locations = [0,1]
        gradientLayer.frame = self.view.bounds
        self.view.layer.insertSublayer(gradientLayer, at: 0)
    }
    
}


