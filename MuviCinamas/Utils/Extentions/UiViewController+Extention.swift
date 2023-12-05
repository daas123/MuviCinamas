//
//  UiView+Extention.swift
//  MuviCinamas
//
//  Created by Neosoft on 30/11/23.
//

import Foundation
import UIKit

extension UIView{
    func customButtonWithGradientColor( button : UIButton,label:String ,textSize : Int = 18, gradColor1 : UIColor = GradientColor.redcolor , gradColor2: UIColor = GradientColor.bluecolor,btnTextColor:UIColor = colorConstant.whitecolor){
        
        // MARK: APPLYING GRADIENT COLOR
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = button.bounds
        gradientLayer.colors = [gradColor2.cgColor,gradColor1.cgColor]
        gradientLayer.locations = [0.0,1.0]
        gradientLayer.startPoint = CGPoint(x: 1, y: 0)
        gradientLayer.endPoint = CGPoint(x: 0, y: 0)
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
    
    func setButtonText(button:UIButton,label:String,color:UIColor = colorConstant
        .blackcolor,size:Int,font_Family:String = BarlowFont.regular ,isbold:Bool = false , borderColor : UIColor = UIColor.clear){
            
            var attributes: [NSAttributedString.Key: Any] = [
                .foregroundColor: color
            ]
            
            attributes[.font] = isbold ? UIFont(name: BarlowFont.bold, size: CGFloat(size)) : UIFont(name: font_Family, size: CGFloat(size))
            
            let attributedText = NSAttributedString(string: label, attributes: attributes)
            button.layer.borderColor = borderColor.cgColor
            button.setAttributedTitle(attributedText, for: .normal)
        }
    
    func setLabelText(lblrefrence: UILabel,lbltext:String,fontSize:Int,font_Family:String = "Barlow-Regular",isBold:Bool = false ,color:UIColor = UIColor.black){
        lblrefrence.text = lbltext
        lblrefrence.font = isBold ? UIFont.boldSystemFont(ofSize: CGFloat(fontSize)) : UIFont(name: font_Family, size: CGFloat(fontSize))
        lblrefrence.textColor = color
        lblrefrence.textAlignment = .center
    }
    
    
    func setImageOnButton(button:UIButton,name:String){
        let image = UIImage(named: name)
        button.setBackgroundImage(image, for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
    }
    
    func setBottomView(botmView:UIView){
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 0, y: botmView.frame.height))
        path.addLine(to: CGPoint(x: botmView.frame.width, y: botmView.frame.height))
        path.addLine(to: CGPoint(x: botmView.frame.width, y: 60))
        path.addLine(to: CGPoint(x: 0, y: 60))
        path.move(to: CGPoint(x: 0, y: 60))
        path.addQuadCurve(to: CGPoint(x: botmView.frame.width, y: 60), controlPoint: CGPoint(x: botmView.frame.width / 2 , y: 0 ))
        path.close()

        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.cgPath
        
        botmView.layer.mask = shapeLayer
    }
    
    func buttonWithCornerradius_Transperent(btn:UIButton,borderColor : UIColor){
        btn.clipsToBounds = true
        btn.layer.cornerRadius = 20
        btn.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMinYCorner]
        btn.layer.borderColor = borderColor.cgColor
        btn.layer.borderWidth = 1
    }
    
    
}
