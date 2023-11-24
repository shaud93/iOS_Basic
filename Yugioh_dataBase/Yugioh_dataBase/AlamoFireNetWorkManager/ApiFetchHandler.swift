//
//  AlamoFireNetworkManager.swift
//  Yugioh_dataBase
//
//  Created by D'Ante Watson on 11/16/23.
//

import Foundation
import Alamofire

class ApiFetchHandler{
    static let sharedInstance = ApiFetchHandler()
    
    
    func fetchAPIData(completionHandler: @escaping ([YugiohData]) -> () ){
          let url = "https://db.ygoprodeck.com/api/v7/cardinfo.php";
        
          AF.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil, interceptor: nil)
            .response{ resp in
                switch resp.result{
                  case .success(let data):
                    do{
                        let jsonData = try JSONDecoder().decode(YugiohModel.self, from: data!)
                        //jsonData.data[0].name
                        completionHandler(jsonData.data)
                   } catch {
                      print(String(describing: error))
                   }
                 case .failure(let error):
                   print(String(describing: error))
                 }
            }
       }
}
