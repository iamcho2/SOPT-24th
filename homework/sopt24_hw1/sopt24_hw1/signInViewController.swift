//
//  signInViewController.swift
//  sopt24_hw1
//
//  Created by admin on 26/04/2019.
//  Copyright © 2019 choyi. All rights reserved.
//

import UIKit

class signInViewController: UIViewController {
    @IBOutlet var view1: UIView!
    @IBOutlet var view2: UIView!
    @IBOutlet var view3: UIView!
    @IBOutlet var view4: UIView!
    @IBOutlet var idField: UITextField!
    @IBOutlet var passField: UITextField!
    @IBOutlet var passField2: UITextField!
    @IBOutlet var nameField: UITextField!
    @IBOutlet var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view1.layer.cornerRadius = 21;
        view1.layer.borderWidth = 0.5;
        view1.layer.borderColor = UIColor(red:206/255, green:206/255, blue:206/255, alpha: 1).cgColor;
        idField.setLeftPaddingPoints(20);

        view2.layer.cornerRadius = 21;
        view2.layer.borderWidth = 0.5;
        view2.layer.borderColor = UIColor(red:206/255, green:206/255, blue:206/255, alpha: 1).cgColor;
        passField.setLeftPaddingPoints(20);
        
        view3.layer.cornerRadius = 21;
        view3.layer.borderWidth = 0.5;
        view3.layer.borderColor = UIColor(red:206/255, green:206/255, blue:206/255, alpha: 1).cgColor;
        passField2.setLeftPaddingPoints(20);
        
        view4.layer.cornerRadius = 21;
        view4.layer.borderWidth = 0.5;
        view4.layer.borderColor = UIColor(red:206/255, green:206/255, blue:206/255, alpha: 1).cgColor;
        nameField.setLeftPaddingPoints(20);
        
        loginButton.layer.cornerRadius = 21;
    }
    


}
