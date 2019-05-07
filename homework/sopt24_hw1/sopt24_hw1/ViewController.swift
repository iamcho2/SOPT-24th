//
//  ViewController.swift
//  sopt24_hw1
//
//  Created by admin on 26/04/2019.
//  Copyright © 2019 choyi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var view1: UIView!
    @IBOutlet var view2: UIView!
    @IBOutlet var idField: UITextField!
    @IBOutlet var passField: UITextField!
    @IBOutlet var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        view1.layer.cornerRadius = 21;
        view1.layer.borderWidth = 0.5;
        view1.layer.borderColor = UIColor(red:206/255, green:206/255, blue:206/255, alpha: 1).cgColor;
        idField.setLeftPaddingPoints(20);
        
        
        view2.layer.cornerRadius = 21;
        view2.layer.borderWidth = 0.5;
        view2.layer.borderColor = UIColor(red:206/255, green:206/255, blue:206/255, alpha: 1).cgColor;
        passField.setLeftPaddingPoints(20);
        
        loginButton.layer.cornerRadius = 21;
        
    }


}

extension UITextField {
    
    func setLeftPaddingPoints(_ amount:CGFloat){ //왼쪽에 여백 주기
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
    
}
