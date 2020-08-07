//
//  UserFriendsTableViewCell.swift
//  LoginForm
//
//  Created by Andrey on 05/08/2020.
//  Copyright © 2020 Andrey. All rights reserved.
//

import UIKit

class UserFriendsTableViewCell: UITableViewCell {

    @IBOutlet weak var friendImage: UIImageView!
    @IBOutlet weak var friendName: UILabel!
    @IBOutlet weak var friendAge: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(for model: Friend) {
        friendName.text = model.name
        friendAge.text = "\(model.age)"
        friendImage.image = UIImage.init(named: model.imageName)
    }

}
