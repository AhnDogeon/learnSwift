//
//  UserCell.swift
//  DemoTableView
//
//  Created by 뚱건 on 2022/11/03.
//

import UIKit

class UserCell: UITableViewCell {
    
    
    @IBOutlet var lastName: UILabel!
    
    @IBOutlet var firstName: UILabel!
    
    @IBOutlet var street: UILabel!
    
    @IBOutlet var cellPhone: UILabel!
    
    
    @IBOutlet var thumbnail: UIImageView!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
