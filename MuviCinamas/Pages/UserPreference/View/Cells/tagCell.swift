//
//  tagCell.swift
//  MuviCinamas
//
//  Created by Neosoft on 05/12/23.
//

import UIKit

class tagCell: UICollectionViewCell {

    @IBOutlet weak var bgView: UIView!
    
    @IBOutlet weak var lblTag: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUi()
        setuplblText()
    }
    
    func setuplblText(){
        setLabelText(lblrefrence: lblTag, lbltext: lblTag.text ?? "", fontSize: 17)
    }
    
    func setupUi(){
        self.layer.borderColor = UIColor.gray.cgColor
        self.layer.borderWidth = 1
        self.layer.cornerRadius = (self.layer.bounds.height) / 4
        self.backgroundColor = .lightGray
        self.lblTag.textColor = .black
    }
    
    func originalState(){
        self.layer.borderColor = UIColor.gray.cgColor
        self.lblTag.textColor = .black
    }
    func changeState(){
        self.layer.borderColor = GradientColor.redcolor.cgColor
        self.lblTag.textColor = GradientColor.redcolor
    }
    

}
