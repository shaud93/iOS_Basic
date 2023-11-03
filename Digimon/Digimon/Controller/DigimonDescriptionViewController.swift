//
//  DigimonDescriptionViewController.swift
//  Digimon
//
//  Created by D'Ante Watson on 11/2/23.
//

import UIKit

class DigimonDescriptionViewController: UIViewController {
    var levelLabel = String()
    var pic = String()
    var namLabel = String()
    @IBOutlet weak var LEVELLABEL: UILabel!
    @IBOutlet weak var PIC: UIImageView!
    @IBOutlet weak var NAMELABEL: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        LEVELLABEL.text = levelLabel
        PIC.load(urlString: pic)
        NAMELABEL.text = namLabel
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
