//
//  UserPreferenceVC.swift
//  MuviCinamas
//
//  Created by Neosoft on 04/12/23.
//

import UIKit

class UserPreferenceVC: UIViewController {
    
    private var selected = [String]()
    @IBOutlet weak var bottomView: UIView!
    @IBOutlet weak var lblMoviePrefrence: UILabel!
    @IBOutlet weak var moviePrefCollectionview: UICollectionView!
    @IBOutlet weak var lblalltypesMovie: UILabel!
    @IBOutlet weak var btnAll: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        moviePrefCollectionview.delegate = self
        moviePrefCollectionview.dataSource = self
        setupUi()
        moviePrefCollectionview.register(UINib(nibName: "tagCell", bundle: nil), forCellWithReuseIdentifier: "tagCell")
        let layout = TagFlowLayout()
        layout.estimatedItemSize = CGSize(width: 140, height: 40)
        moviePrefCollectionview.collectionViewLayout = layout
        
        
    }
    
    func setupUi(){
        //MARK: Set label preference title
        view.setLabelText(lblrefrence: lblMoviePrefrence, lbltext: TxtConstant.do_you_have_any_preference_of_movies, fontSize: 25)
        
        //MARK: Set label bottom title
        view.setLabelText(lblrefrence: lblalltypesMovie, lbltext: TxtConstant.i_like_all_types_of_movies, fontSize: 16 )
        
        //MARK: Set design for all Button
        view.setButtonText(button:btnAll, label: "  ALL  ", size: 14,isbold: true)
        view.buttonWithCornerradius_Transperent(btn: btnAll, borderColor: colorConstant.blackcolor)
    }
    
}

extension UserPreferenceVC:UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        userPreferences.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "tagCell",
                                                            for: indexPath) as? tagCell else {
            return tagCell()
        }
        cell.lblTag.text = userPreferences[indexPath.row]
        cell.lblTag.preferredMaxLayoutWidth = collectionView.frame.width - 16
        
        
        if selected.contains(userPreferences[indexPath.row]) {
            cell.changeState()
        } else {
            cell.originalState()
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) as? tagCell, let text = cell.lblTag.text else {return}
        
        if selected.contains(text) {
            selected = selected.filter{$0 != text}
        } else {
            selected.append(text)
        }
        collectionView.reloadData()
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: 200, height: 30)
    }
    
    
}

class Row {
    var attributes = [UICollectionViewLayoutAttributes]()
    var spacing: CGFloat = 0
    
    init(spacing: CGFloat) {
        self.spacing = spacing
    }
    
    func add(attribute: UICollectionViewLayoutAttributes) {
        attributes.append(attribute)
    }
    
    func tagLayout(collectionViewWidth: CGFloat) {
        let padding = 10
        var offset = padding
        for attribute in attributes {
            attribute.frame.origin.x = CGFloat(offset)
            offset += Int(attribute.frame.width + spacing)
        }
    }
}

class TagFlowLayout: UICollectionViewFlowLayout {
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        guard let attributes = super.layoutAttributesForElements(in: rect) else {
            return nil
        }
        
        var rows = [Row]()
        var currentRowY: CGFloat = -1
        
        for attribute in attributes {
            if currentRowY != attribute.frame.origin.y {
                currentRowY = attribute.frame.origin.y
                rows.append(Row(spacing: 10))
            }
            rows.last?.add(attribute: attribute)
        }
        
        rows.forEach {
            $0.tagLayout(collectionViewWidth: collectionView?.frame.width ?? 0)
        }
        return rows.flatMap { $0.attributes }
    }
}
