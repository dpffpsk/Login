//
//  LoginViewController.swift
//  SportifyLoginSampleApp
//
//  Created by 이니텍 on 2021/12/09.
//

import UIKit
import Firebase
import GoogleSignIn

class LoginViewController: UIViewController {
    
    @IBOutlet var emailLoginButton: UIButton!
    @IBOutlet var googleLoginButton: UIButton!
    @IBOutlet var appleLoginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //버튼 UI설정
        [emailLoginButton, googleLoginButton, appleLoginButton].forEach {
            $0?.layer.borderWidth = 1
            $0?.layer.borderColor = UIColor.white.cgColor
            $0?.layer.cornerRadius = 30
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.navigationBar.isHidden = true
    }
    
    
    //구글 로그인하기
    @IBAction func googleLoginButtonTapped(_ sender: UIButton) {
        
        guard let clientID = FirebaseApp.app()?.options.clientID else { return }
        let config = GIDConfiguration(clientID: clientID)
        GIDSignIn.sharedInstance.signIn(with: config, presenting: self) { [unowned self] user, error in
          
            //에러처리
            if let error = error {
                print("ERROR", error.localizedDescription)
                return
            }
            
            //인증 값
            guard let authentication = user?.authentication,
            let idToken = authentication.idToken else { return }
            //구글 id 토큰(access 토큰) 받은 것
            let credential = GoogleAuthProvider.credential(withIDToken: idToken, accessToken: authentication.accessToken)
            //토큰값 firebase 인증 정보로 등록
            Auth.auth().signIn(with: credential) { _, _ in
                self.showMainViewController()
            }
        }
    }
    
    
    @IBAction func appleLoginButtonTapped(_ sender: Any) {
        //firebase 인증
    }
    
    
    //MARK: - showMainViewcontroller
    private func showMainViewController() {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let mainViewController = storyboard.instantiateViewController(identifier: "MainViewController")
        mainViewController.modalPresentationStyle = .fullScreen
        navigationController?.show(mainViewController, sender: nil)
    }
}
