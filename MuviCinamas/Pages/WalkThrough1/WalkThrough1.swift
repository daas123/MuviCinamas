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
        view.setBottomView(botmView: bottomView)
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
