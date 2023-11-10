//
//  HomeViewController.swift
//  FirstUi
//
//  Created by D'Ante Watson on 10/31/23.
//

import UIKit

class HomeViewController: UIViewController {
    
    var homeLabelText = String()
    
    @IBOutlet weak var HomeLabelText: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        HomeLabelText.text = homeLabelText
        // Do any additional setup after loading the view.
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
