//
//  ViewController.swift
//  FirebaseExample
//
//  Created by D'Ante Watson on 12/4/23.
//

import UIKit
import FirebaseAuth
import FirebaseAuthUI
import FirebaseEmailAuthUI
import FirebaseGoogleAuthUI
import FirebaseAnalytics

class ViewController: UIViewController, FUIAuthDelegate {

        override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func signUp(_ sender: Any) {
        //TODO: sign in using email and password
        var actionCodeSettings = ActionCodeSettings()
        actionCodeSettings.url = URL(string: "https://example.appspot.com")
        actionCodeSettings.handleCodeInApp = true
        actionCodeSettings.setAndroidPackageName("com.firebase.example", installIfNotAvailable: false, minimumVersion: "12")

        let provider = FUIEmailAuth(authAuthUI: FUIAuth.defaultAuthUI()!,
                                    signInMethod: GoogleAuthSignInMethod,
                                    forceSameDevice: false,
                                    allowNewEmailAccounts: true,
                                    actionCodeSetting: actionCodeSettings)
        let authUI = FUIAuth.defaultAuthUI()
        // You need to adopt a FUIAuthDelegate protocol to receive callback
        authUI?.delegate = self
        authUI?.providers = [provider]
        
        if let authViewController = authUI?.authViewController() {
            self.present(authViewController, animated: true)
        }
        
        
    }
    
    @IBAction func signIn(_ sender: Any) {
        
        Analytics.logEvent(AnalyticsEventLogin, parameters: [
            "Event":"Sign up"
        ])
        
        let authUI = FUIAuth.defaultAuthUI()!
        // You need to adopt a FUIAuthDelegate protocol to receive callback
        authUI.delegate = self
        let googleAuthProvider = FUIGoogleAuth(authUI: authUI)
        let providers: [FUIAuthProvider] = [
          googleAuthProvider
        ]
        authUI.providers = providers
        let authViewController = authUI.authViewController()
            self.present(authViewController, animated: true)
        
    }
    func authUI(_ authUI: FUIAuth, didSignInWith user: User?, error: Error?) {
        print(user)
        
        if error == nil {
                // HANDLE login
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            
            let detail = storyboard.instantiateViewController(identifier: "HomeViewController") as! HomeViewController
            
            self.navigationController?.pushViewController(detail, animated:true)
            } else {
                fatalError("SIGN IN FAILED")
            }
        
    }
}

