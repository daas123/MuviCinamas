//
//  walkThroughCells.swift
//  MuviCinamas
//
//  Created by Neosoft on 04/12/23.
//

import UIKit

class walkThroughCells: UICollectionViewCell {

    var labeltext : String?
    @IBOutlet weak var welCometext: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setLabelText(lblrefrence: welCometext, lbltext: labeltext ?? "", fontSize: 25)
    }

}
