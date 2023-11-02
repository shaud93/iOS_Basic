//
//  ProfilePicViewController.swift
//  FirstUi
//
//  Created by D'Ante Watson on 11/1/23.
//

import UIKit

class ProfilePicViewController: UIViewController {

    var img:NSArray = ["f1","f2","f3","f4","f5","f6","f7","f8","f9","f10","f12","f13"]
    
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
extension ProfilePicViewController:UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return img.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "pictureCell", for: indexPath) as! ProfilePicCollectionViewCell
        cell.IMAGE.image = UIImage(named: img[indexPath.row] as! String)
            return cell
    }

}

extension ProfilePicViewController:UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(img[indexPath.row])
        
            //send data to next page
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let json = storyboard.instantiateViewController(withIdentifier: "JsonViewController") as! JsonViewController
            
            self.navigationController?.pushViewController(json, animated:true)
        }
    }
