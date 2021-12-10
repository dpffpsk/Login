//
//  LoginViewController.swift
//  SportifyLoginSampleApp
//
//  Created by 이니텍 on 2021/12/09.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet var emailLoginButton: UIButton!
    @IBOutlet var googleLoginButton: UIButton!
    @IBOutlet var appleLoginButton: UIButton!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewDidLoad()
        
        //버튼 UI설정
        [emailLoginButton, googleLoginButton, appleLoginButton].forEach {
            $0?.layer.borderWidth = 1
            $0?.layer.borderColor = UIColor.white.cgColor
            $0?.layer.cornerRadius = 30
        }
        navigationController?.navigationBar.isHidden = true
    }
    
    
    @IBAction func googleLoginButtonTapped(_ sender: UIButton) {
        //firebase 인증
    }
    
    
    @IBAction func appleLoginButtonTapped(_ sender: Any) {
        //firebase 인증
    }
    
}
