//
//  EpisodeTableViewCell.swift
//  FirstUi
//
//  Created by D'Ante Watson on 11/1/23.
//

import UIKit

class EpisodeTableViewCell: UITableViewCell {

    var label:String = ""
    @IBOutlet weak var etLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
