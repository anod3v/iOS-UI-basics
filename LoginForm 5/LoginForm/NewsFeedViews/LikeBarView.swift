//
//  LikeBarView.swift
//  LoginForm
//
//  Created by Andrey on 01/09/2020.
//  Copyright © 2020 Andrey. All rights reserved.
//

import UIKit

class LikeBarView: UIView {
    
    @IBOutlet weak var likeButton: LikeButton!
    @IBOutlet weak var likeCounterLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func commonInit() {
        let profileViewFromXib = Bundle.main.loadNibNamed("LikeBarView", owner: self, options: nil)![0] as! UIView
        profileViewFromXib.frame = self.bounds
        addSubview(profileViewFromXib)
    }
    
    @IBAction func pressLikeButton(_ sender: Any) {
    //        print("button is pressed")
            if likeButton.filled {
                let count = Int(likeCounterLabel.text!)
                likeCounterLabel.text = String(count! + 1)
            } else {
                let count = Int(likeCounterLabel.text!)
                likeCounterLabel.text = String(count! - 1)
            }
        }
    
}

