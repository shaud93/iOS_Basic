//
//  EpisodeViewController.swift
//  FirstUi
//
//  Created by D'Ante Watson on 11/1/23.
//

import UIKit

class EpisodeViewController: UIViewController{
    
    var elabel = "HI"
    
    @IBOutlet weak var Elabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        Elabel.text = elabel
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
