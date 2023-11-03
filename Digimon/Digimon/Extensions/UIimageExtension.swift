//
//  UIimageExtension.swift
//  Digimon
//
//  Created by D'Ante Watson on 11/3/23.
//

import Foundation
import UIKit
extension UIImageView{
    func load(urlString: String) {
        guard let url = URL(string: urlString) else {
            return
        }
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
