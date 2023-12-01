//
//  UiView+Extention.swift
//  MuviCinamas
//
//  Created by Neosoft on 30/11/23.
//

import Foundation
import UIKit

extension UIViewController{
    func customButtonWithGradientColor( button : UIButton,label:String ,textSize : Int = 18, gradColor1 : UIColor = GradientColor.redcolor , gradColor2: UIColor = GradientColor.bluecolor,btnTextColor:UIColor = GradientColor.whitecolor){
        
        // MARK: APPLYING GRADIENT COLOR
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = button.bounds
        gradientLayer.colors = [gradColor1.cgColor,gradColor2.cgColor]
        gradientLayer.locations = [0.0,1.0]
        gradientLayer.startPoint = CGPoint(x: 1, y: 0)
        gradientLayer.endPoint = CGPoint(x: 0, y: 1)
        button.layer.addSublayer(gradientLayer)
        
        // MARK: APPLYING CORNER RADIUS
        button.clipsToBounds = true
        button.layer.cornerRadius = 20
        button.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMinYCorner]
        
        // MARK: SETTING BUTTON ATTRIBUTES
        let attributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.boldSystemFont(ofSize: CGFloat(textSize)),
            .foregroundColor: btnTextColor
        ]
        let attributedText = NSAttributedString(string: label, attributes: attributes)
        button.setAttributedTitle(attributedText, for: .normal)
        
    }
    
    func setButtonText(button:UIButton,label:String,color:UIColor = GradientColor
        .blackcolor,size:Int,font_Family:String = "Barlow-Regular",isbold:Bool = false){
            
            var attributes: [NSAttributedString.Key: Any] = [
                .foregroundColor: color
            ]
            
            attributes[.font] = isbold ? UIFont(name: "Barlow-Bold", size: CGFloat(size)) : UIFont(name: font_Family, size: CGFloat(size))
            
            let attributedText = NSAttributedString(string: label, attributes: attributes)
            button.setAttributedTitle(attributedText, for: .normal)
        }
    
    func setLabelText(lblrefrence: UILabel,lbltext:String,fontSize:Int,font_Family:String = "Barlow-Regular",isBold:Bool = false ,color:UIColor = UIColor.black){
        lblrefrence.text = lbltext
        lblrefrence.font = isBold ? UIFont.boldSystemFont(ofSize: CGFloat(fontSize)) : UIFont(name: font_Family, size: CGFloat(fontSize))
        lblrefrence.textColor = color
        lblrefrence.textAlignment = .center
    }
    
    func setNavigationHidden(){
        self.navigationController?.isNavigationBarHidden = true
    }
    
    func setImageOnButton(button:UIButton,name:String){
        let image = UIImage(named: name)
        button.setBackgroundImage(image, for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        
    }
    
}