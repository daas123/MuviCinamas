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
        setimagesOnButton()
        setTextOnButtons()
        setlabelsText()
    }
    
    func setimagesOnButton(){
        view.setImageOnButton(button: btnloginWithGoogle, name: ImageConstant.Google)
        view.setImageOnButton(button: btnloginWithFaceBook, name: ImageConstant.Meta)
        view.setImageOnButton(button: btnloginWithApple, name: ImageConstant.Apple)
    }
    
    func setTextOnButtons(){
        //MARK: Text SignUP
        view.setButtonText(button: btnSignUp, label: BtnConstant.signup,color: colorConstant.whitecolor, size: 37)
        
        //MARK: Text Register button
        view.setButtonText(button: btnregisterWithMobile, label: BtnConstant.register_with_Mobile,color: colorConstant.lightGray, size: 19)
        btnregisterWithMobile.clipsToBounds = true
        btnregisterWithMobile.layer.cornerRadius = 20
        btnregisterWithMobile.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMinYCorner]
        btnregisterWithMobile.layer.borderColor = colorConstant.blackcolor.cgColor
        btnregisterWithMobile.layer.borderWidth = 1
        
        //MARK: Text without Register button
        view.setButtonText(button: btnCountinueWithOutLogin, label: BtnConstant.continue_without_login,color: colorConstant.whitecolor, size: 18)
    }
    
    func setlabelsText(){
        view.setLabelText(lblrefrence: lblbelowofSignUp, lbltext: TxtConstant.It_easier_to_sign_in_now, fontSize: 22 ,color: UIColor.white)
    }
    
    
}
