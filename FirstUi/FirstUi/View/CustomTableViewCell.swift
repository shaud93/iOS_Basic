//
//  CustomTableViewCell.swift
//  FirstUi
//
//  Created by D'Ante Watson on 11/2/23.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var CustomLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
