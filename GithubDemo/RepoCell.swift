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
    @IBOutlet weak var ownerLabel: UILabel!
    @IBOutlet weak var avatarView: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var forkLabel: UILabel!
    @IBOutlet weak var starLabel: UILabel!
    var repo: GithubRepo! {
        didSet{
            self.nameLabel.text = repo.name
            nameLabel.sizeToFit()
            let imageURL = URL(string: repo.ownerAvatarURL!)
            self.avatarView.setImageWith(imageURL!)
            self.descriptionLabel.text = repo.repoDescription
            descriptionLabel.sizeToFit()
            self.forkLabel.text = " \(repo.forks!)"
            self.starLabel.text = "\(repo.stars!)"
            
            
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
