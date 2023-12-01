//
//  WalkThrough2.swift
//  MuviCinamas
//
//  Created by Neosoft on 01/12/23.
//

import UIKit

class WalkThrough2: UIViewController {
    
    @IBOutlet weak var bottomView: UIView!
    @IBOutlet weak var nxtBtn: UIButton!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var lblMovie: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationHidden()
        setBottomView()
        customButtonWithGradientColor(button: nxtBtn, label: "GET STARTED",textSize: 15)
        setPageControl()
        setLabelText(lblrefrence: lblMovie, lbltext: "Movie experience for every mood", fontSize: 25)
    }
    
    func setPageControl(){
        self.pageControl.currentPage = 1
    }
    
    func setBottomView(){
        
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 0, y: bottomView.frame.height))
        path.addLine(to: CGPoint(x: bottomView.frame.width, y: bottomView.frame.height))
        path.addLine(to: CGPoint(x: bottomView.frame.width, y: 60))
        path.addLine(to: CGPoint(x: 0, y: 60))
        path.move(to: CGPoint(x: 0, y: 60))
        path.addQuadCurve(to: CGPoint(x: bottomView.frame.width, y: 60), controlPoint: CGPoint(x: bottomView.frame.width / 2 , y: 0 ))
        path.close()

        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.cgPath
        
        bottomView.layer.mask = shapeLayer
    }
    
    @IBAction func onNextBtn(_ sender: UIButton) {
        navigationController?.pushViewController(loginVc(nibName: "loginVc", bundle: nil), animated: true)
    }
    
}
