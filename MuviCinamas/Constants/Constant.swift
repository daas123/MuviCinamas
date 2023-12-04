//
//  ColorConstant.swift
//  MuviCinamas
//
//  Created by Neosoft on 01/12/23.
//

import Foundation
import UIKit

// MARK: Color Constant
struct GradientColor{
    static var redcolor = UIColor(red: 0.92, green: 0.19, blue: 0.36, alpha: 1.00)
    static var bluecolor = UIColor(red: 0.34, green: 0.11, blue: 0.85, alpha: 1.00)
}

struct colorConstant{
    static var whitecolor = UIColor.white
    static var blackcolor = UIColor.black
    static var lightGray = UIColor(red: 0.78, green: 0.78, blue: 0.79, alpha: 1.00)
}

// MARK: FontFamalyConstant
struct BarlowFont{
    static var regular = "Barlow-Regular"
    static var bold = "Barlow-Bold"
}


// MARK: Text Constant
struct TxtConstant{
    
    static var emptStr = ""
    static var errorStr = "Some Thing Went WRong"
    
    // For walkthrough1 file
    static var title1 = "Movie experience for every mood"
    
    // For walkthrough2 file
    static var title2 = "Smooth & enjoyable Experience"
    
    // for Login
    static var It_easier_to_sign_in_now = "It’s easier to sign in now"
}


// MARK: Button Text Constant
struct BtnConstant{
    
    //For walkthrough1 File
    static var next = "NEXT"
    
    //For walkthrough2 File
    static var getStarted = "GET STARTED"
    
    // For login File
    static var signup = "Sign Up"
    static var register_with_Mobile = "Register with Mobile"
    static var continue_without_login = "Continue without login"
    
}

// MARK: Image Constant

struct ImageConstant{
    // For login file
    static var Google = "google"
    static var Meta = "meta"
    static var Apple = "apple"
}


// MARK: UiView Name

struct Nibname{
    static var WalkThrough1 = "WalkThrough1"
    static var WalkThrough2 = "WalkThrough2"
    static var walkThroughCells = "walkThroughCells"
    static var loginVc = "loginVc"
}
