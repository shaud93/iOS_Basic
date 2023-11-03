//
//  JsonViewController.swift
//  FirstUi
//
//  Created by D'Ante Watson on 11/2/23.
//

import UIKit

class JsonViewController: UIViewController {

    @IBOutlet weak var Table: UITableView!
    
    var user2:UserModel?
    
    var listUsers:[User] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let celXib = UINib(nibName: "CustomTableViewCell", bundle: nil)
        Table.register(celXib, forCellReuseIdentifier:"CustID" )
        loadJson()

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

    func loadJson(){
       let bundle = Bundle(for: JsonViewController.self)
       let url = bundle.url(forResource:"UsersList", withExtension:"json")
       guard let url = url else {return}
       do {         
        let rawB = try Data(contentsOf: url)
        let res = try JSONDecoder().decode(UserModel.self, from: rawB)
        listUsers = res.data
         print(res)
     } catch {print(error)}
   }
    
    
//    func getUser() async throws -> UserModel{
//        //holds the url String
//        let endpoint = "https://reqres.in/api/users"
//        
//        //converts string into URL
//        guard let url = URL(string: endpoint) else {throw custError.invalidUrl}
//        
//        let (data, response) = try await URLSession.shared.data(from: url)
//        
//       guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {throw custError.invalidResponse}
//        
//        let decoder = JSONDecoder()
//        do{
//            return try decoder.decode(UserModel.self, from: data)
//                   
//        }catch {throw custError.invalidData}
//   }
}

extension JsonViewController:UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        listUsers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustID" ) as! CustomTableViewCell
        
        cell.CustomLabel.text = listUsers[indexPath.row].first_name
        
        return cell
    }
    
    
}

extension JsonViewController:UITableViewDelegate {
    
}
