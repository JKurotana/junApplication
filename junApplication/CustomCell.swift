//
//  CustomCell.swift
//  junApplication
//
//  Created by JUN TANAKA on 2017/04/17.
//  Copyright © 2017年 JUN TANAKA. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {

    @IBOutlet weak var Phrase: UILabel!
    
    @IBOutlet weak var translation: UILabel!
    
    override func awakeFromNib() {
                super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
