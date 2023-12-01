//
//  loginVc.swift
//  MuviCinamas
//
//  Created by Neosoft on 01/12/23.
//

import UIKit

class loginVc: UIViewController {
    
    @IBOutlet weak var lblbelowofSignUp: UILabel!
    @IBOutlet weak var btnSignUp: UIButton!
    @IBOutlet weak var btnregisterWithMobile: UIButton!
    @IBOutlet weak var btnCountinueWithOutLogin: UIButton!
    @IBOutlet weak var btnloginWithGoogle: UIButton!
    @IBOutlet weak var btnloginWithFaceBook: UIButton!
    @IBOutlet weak var btnloginWithApple: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setImageOnButton(button: btnloginWithFaceBook, name: "meta")
        
    }


}
