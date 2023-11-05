//
//  DigimonViewController.swift
//  Digimon
//
//  Created by D'Ante Watson on 11/2/23.
//

import UIKit

class DigimonViewController: UIViewController {
    var digiList:[DigiModel] = []

    @IBOutlet weak var GRIDTABLE: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //callDigimonApi()
        
        
        
        let celXib = UINib(nibName: "DigimonCustomCollectionViewCell", bundle: nil)
        GRIDTABLE.register(celXib, forCellWithReuseIdentifier:"digiGrid" )

        // Do any additional setup after loading the view.
        callDigimonFromNetworkmanagerUsingProtocolDelegation()
        
    }
    func callDigimonFromNetworkmanagerUsingProtocolDelegation(){
        let network = NetworkManager()
        network.networkresponseProtocol = self
        guard let url = URL(string: "https://digimon-api.vercel.app/api/digimon")else {return}
        network.getDatafromApiUsingProtocolDelegate(url: url)
    }
    
    func callDigimonApi() {
        let network = NetworkManager()
        guard let url = URL(string: "https://digimon-api.vercel.app/api/digimon")else {return}
        network.getApi(url: url, modelType: [DigiModel].self) { result in
            
            switch result {
            case .success(let digiData):
                print("hey")
                DispatchQueue.main.async {
                    self.digiList = digiData
                    self.GRIDTABLE.reloadData()
                }
                //print(self.digiList)
                    
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}

extension DigimonViewController:UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        digiList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "digiGrid", for: indexPath) as! DigimonCustomCollectionViewCell
        let getimageUrl = digiList[indexPath.row].img
        print(getimageUrl)
        cell.IMAGE.load(urlString: getimageUrl)
        return cell
    }
}

extension DigimonViewController:UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let detail = storyboard.instantiateViewController(identifier: "desc") as! DigimonDescriptionViewController
        
        detail.levelLabel = digiList[indexPath.row].level
        
        detail.pic = digiList[indexPath.row].img
        
        detail.namLabel = digiList[indexPath.row].name
        
        self.navigationController?.pushViewController(detail, animated:true)
    }
}

extension DigimonViewController:NetworkResponseProtocal{
    func didFinishWithError(error: Error) {
        print(error.localizedDescription)
    }
    
    func didFinishWithResponse(digiData:[DigiModel]) {
        DispatchQueue.main.async {
            self.digiList = digiData
            self.GRIDTABLE.reloadData()
        }
    }
}
