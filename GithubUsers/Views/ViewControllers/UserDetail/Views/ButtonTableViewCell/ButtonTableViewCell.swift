//
//  ButtonTableViewCell.swift
//  GithubUsers
//
//  Created by C100-105 on 15/03/21.
//

import UIKit

class ButtonTableViewCell: BaseTableViewCell {

    @IBOutlet weak var btn: UIButton!
    var callbackSaveClicked: Callback?
    
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
        
        btn.showBorder(.label, 5, 1)
    }
    
    @IBAction func btnAction(_ sender: UIButton) {
        callbackSaveClicked?()
    }
}
