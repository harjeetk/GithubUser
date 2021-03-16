//
//  UserDetailTableViewCell.swift
//  GithubUsers
//
//  Created by C100-105 on 15/03/21.
//

import UIKit

class UserInfoTableViewCell: BaseTableViewCell {

    @IBOutlet weak var lblFollowers: UILabel!
    @IBOutlet weak var lblFollowing: UILabel!
    
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblCompany: UILabel!
    @IBOutlet weak var lblBlog: UILabel!
    
    @IBOutlet weak var viewInfoContainer: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func setupUI() {
        super.setupUI()
        
        viewInfoContainer.showBorder(.label, 5, 1)
        
        lblName.numberOfLines = 0
        lblCompany.numberOfLines = 0
        lblBlog.numberOfLines = 0
    }
}
