//
//  SwiftToUiViewController.swift
//  Swifty
//
//  Created by D'Ante Watson on 11/7/23.
//

import UIKit
import SwiftUI

class SwiftToUiViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func ToSwiftUi(_ sender: Any) {
        let homeViewController = UIHostingController(rootView: ContentView(navi: self.navigationController))
        
        self.navigationController?.pushViewController(homeViewController, animated:true)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    

}
