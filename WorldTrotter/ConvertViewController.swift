//
//  ViewController.swift
//  WorldTrotter
//
//  Created by Jessica  Duell on 1/9/22.
//

import UIKit

class ConvertViewController: UIViewController {
// With gradient background background color won't change so commented out so background color will change in viewWillAppear
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        let grey2 = UIColor.Custom.Grey.DarkGrey.cgColor
//        let grey = UIColor.Custom.Grey.Grey.cgColor
//        setGradientBackground(color1: grey, color2: grey2)
//    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(false)
        
        let randomColors =
        ["darkGrey": UIColor.Custom.Grey.DarkGrey,
            "grey":UIColor.Custom.Grey.Grey,
            "greyBrown":UIColor.Custom.Grey.GreyBrown,
            "aqua":UIColor.Custom.Blue.Aqua,
            "teal":UIColor.Custom.Blue.Teal,
            "pink":UIColor.Custom.Red.Pink,
            "limeGreen":UIColor.Custom.Green.LimeGreen]
        
        let randomColor = randomColors.randomElement()
        
        
        if let c1 = randomColor?.value {
            self.view.backgroundColor = c1
        } else {
            let grey2 = UIColor.Custom.Grey.DarkGrey.cgColor
            let grey = UIColor.Custom.Grey.Grey.cgColor
            setGradientBackground(color1: grey, color2: grey2)
        }
        
    }
    
    func setGradientBackground(color1:CGColor, color2:CGColor){
        let gradientLayer = CAGradientLayer()
        
        gradientLayer.colors = [color1, color2]
        gradientLayer.startPoint = CGPoint(x:0.5, y:1.0)
        gradientLayer.endPoint = CGPoint(x:0.5, y:0.0)
        gradientLayer.locations = [0,1]
        gradientLayer.frame = self.view.bounds
        self.view.layer.insertSublayer(gradientLayer, at: 0)
    }
    
}


