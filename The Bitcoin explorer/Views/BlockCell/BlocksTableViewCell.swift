//
//  BlocksTableViewCell.swift
//  The Bitcoin explorer
//
//  Created by Kristian Georgiev on 6.11.21.
//

import UIKit

class BlocksTableViewCell: UITableViewCell {

    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.backgroundColor = .orange
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
