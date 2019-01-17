//
//  CardCell.swift
//  Playground
//
//  Created by 吉川昂広 on 2019/01/17.
//  Copyright © 2019 takahiro yoshikawa. All rights reserved.
//

import UIKit

class CardCell: UITableViewCell {
    
    @IBOutlet weak var label: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func awakeAfter(using aDecoder: NSCoder) -> Any? {
        return super.awakeAfter(using: aDecoder)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func cellConfigure() {
        self.backgroundColor = UIColor.clear
        
        self.label.backgroundColor = UIColor.blue
        self.label.layer.cornerRadius = 5
        self.label.layer.masksToBounds = true
        
        
    }
}
