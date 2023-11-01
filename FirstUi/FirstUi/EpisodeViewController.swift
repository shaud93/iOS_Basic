//
//  EpisodeViewController.swift
//  FirstUi
//
//  Created by D'Ante Watson on 11/1/23.
//

import UIKit

class EpisodeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    var elabel = "HI"
    var s1:NSArray = ["EPISODE 1", "EPISODE 2","EPISODE 3","EPISODE 4","EPISODE 5","EPISODE 6","EPISODE 7","EPISODE 8","EPISODE 9","EPISODE 10","EPISODE 11"]
//    var s2:NSArray = ["EPISODE 1", "EPISODE 2","EPISODE 3","EPISODE 4","EPISODE 5","EPISODE 6","EPISODE 7","EPISODE 8","EPISODE 9","EPISODE 10"]
    
    @IBOutlet weak var detaillabel: UILabel!
    @IBOutlet weak var Elabel: UILabel!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (elabel == "SEASON 1"){
            return s1.count
        }
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ecell") as! EpisodeTableViewCell
        
        cell.etLabel.text = s1[indexPath.row] as? String
        
        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
       // Elabel.text = "Testing"
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
