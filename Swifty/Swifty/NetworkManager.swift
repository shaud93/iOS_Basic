//
//  NetworkManager.swift
//  Swifty
//
//  Created by D'Ante Watson on 11/6/23.
//

import Foundation
class Network:ObservableObject {
    @Published var digimonList:[DigimonModel]=[]
    
    
    func getDigimon() {
        guard let url = URL(string: "https://digimon-api.vercel.app/api/digimon") else { fatalError("Missing URL") }
        
        let urlRequest = URLRequest(url: url)
        
        let dataTask = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            if let error = error {
                print("Request error: ", error)
                return
            }
            
            guard let response = response as? HTTPURLResponse else { return }
            
            if response.statusCode == 200 {
                guard let data = data else { return }
                DispatchQueue.main.async {
                    do {
                        let decodedUsers = try JSONDecoder().decode([DigimonModel].self, from: data)
                        self.digimonList = decodedUsers
                    } catch let error {
                        print("Error decoding: ", error)
                    }
                }
            }
        }
        
        dataTask.resume()
    }
}
