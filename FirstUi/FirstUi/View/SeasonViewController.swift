//
//  SeasonViewController.swift
//  FirstUi
//
//  Created by D'Ante Watson on 11/1/23.
//

import UIKit

class SeasonViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let seasonsViewModel = SeasonsViewModel()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return seasonsViewModel.seasons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "scell") as! SeasonTableViewCell
        
        cell.SeasonLabel.text = seasonsViewModel.seasons[indexPath.row] as? String
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //send data to next page
       let storyboard = UIStoryboard(name: "Main", bundle: nil)
       let episode = storyboard.instantiateViewController(withIdentifier: "EpisodeViewController") as! EpisodeViewController
//        
        episode.elabel = seasonsViewModel.seasons[indexPath.row] as! String
//        
      self.navigationController?.pushViewController(episode, animated:true)
        //self.present(episode, animated: true)
        
        
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

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
