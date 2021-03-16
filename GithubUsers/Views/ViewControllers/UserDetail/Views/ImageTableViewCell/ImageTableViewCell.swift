//
//  ImageTableViewCell.swift
//  GithubUsers
//
//  Created by C100-105 on 15/03/21.
//

import UIKit

class ImageTableViewCell: BaseTableViewCell {

    //MARK: Variables
    @IBOutlet weak var imgView: UIImageView!
    
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
        
        imgView.showBorder(.label, 5, 1)
    }
}
