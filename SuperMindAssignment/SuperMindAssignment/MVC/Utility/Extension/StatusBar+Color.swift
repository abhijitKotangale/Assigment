//
//  StatusBar+Color.swift
//  SuperMindAssignment
//
//  Created by Abhijit Kotangale on 11/01/23.
//

import Foundation
import UIKit

let IS_IPHONE_X     =   (UIScreen.main.bounds.size.height >= 812.0)
let SCREEN_WIDTH    =   UIScreen.main.bounds.size.width
let SCREEN_HEIGHT   =   UIScreen.main.bounds.size.height

extension UIView {
    //MARK: Set Status Bar Color
    func setStatusBarColor(){
        var statusBarView: UIView
        if IS_IPHONE_X {
            statusBarView = UIView(frame: CGRect(x:0, y:0, width: SCREEN_WIDTH, height: 44))
        }
        else{
            statusBarView = UIView(frame: CGRect(x:0, y:0, width: SCREEN_WIDTH, height: 20))
        }
        statusBarView.backgroundColor = UIColor.AppTheme.primaryColor
        self.addSubview(statusBarView)
    }
}
