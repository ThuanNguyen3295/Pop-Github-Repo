//
//  RepoCell.swift
//  GithubDemo
//
//  Created by Thuan Nguyen on 2/16/17.
//  Copyright © 2017 codepath. All rights reserved.
//

import UIKit

class RepoCell: UITableViewCell {
    
    
    @IBOutlet weak var nameLabel: UILabel!
    
    var repo: GithubRepo! {
        didSet{
            self.nameLabel.text = repo.name
            nameLabel.sizeToFit()
            
        }
        }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
