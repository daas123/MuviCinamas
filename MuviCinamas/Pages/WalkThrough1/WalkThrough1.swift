//
//  WalkThrough1.swift
//  MuviCinamas
//
//  Created by Neosoft on 01/12/23.
//

import UIKit

class WalkThrough1: UIViewController {
    
    @IBOutlet weak var bottomView: UIView!
    @IBOutlet weak var nxtBtn: UIButton!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setBottomView()
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.delegate = self
        collectionView.dataSource  = self
        collectionView.register(UINib(nibName: Nibname.walkThroughCells, bundle: nil), forCellWithReuseIdentifier: Nibname.walkThroughCells)
        view.customButtonWithGradientColor(button: nxtBtn, label: BtnConstant.next)
        setPageControl()

    }
    
    func setPageControl(){
        self.pageControl.currentPage = 0
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
        if self.pageControl.currentPage == 1{
            navigationController?.pushViewController(loginVc(nibName: Nibname.loginVc, bundle: nil), animated: true)
        }
        collectionView.scrollToItem(at: IndexPath(item: 1, section: 0), at: .centeredHorizontally, animated: true)
        self.pageControl.currentPage = 1
    }
    
}

extension WalkThrough1:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        walkthroughtData.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var cell = collectionView.dequeueReusableCell(withReuseIdentifier: Nibname.walkThroughCells, for: indexPath) as! walkThroughCells
        cell.welCometext.text = walkthroughtData[indexPath.row].title
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width, height: collectionView.bounds.height)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageWidth = collectionView.bounds.width
        let currentPage = Int((collectionView.contentOffset.x + pageWidth / 2) / pageWidth)
        pageControl.currentPage = currentPage
    
        switch currentPage{
        case 0 :
            view.customButtonWithGradientColor(button: nxtBtn, label: BtnConstant.next)
        case 1:
            view.customButtonWithGradientColor(button: nxtBtn, label: "   \(BtnConstant.getStarted)   ")
        default:
            print(TxtConstant.errorStr)
        }
    }
    
    
}
