//
//  WebViewController.swift
//  FirstUi
//
//  Created by D'Ante Watson on 11/1/23.
//

import UIKit
import WebKit

class WebViewController: UIViewController {

    @IBOutlet weak var WebView: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        loadUrl()
    }
    
    func loadUrl(){
        guard let url = URL(string: "https://www.imdb.com/title/tt2861424/") else {return}
        let request = URLRequest(url: url)
        WebView.load(request)
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
