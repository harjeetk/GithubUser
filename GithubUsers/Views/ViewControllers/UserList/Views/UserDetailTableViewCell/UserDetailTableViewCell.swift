//
//  UserDetailTableViewCell.swift
//  GithubUsers
//
//  Created by C100-105 on 15/03/21.
//

import UIKit
//import SkeletonView

class UserDetailTableViewCell: BaseTableViewCell {

    //MARK: Variables
    @IBOutlet weak var imgAvatar: UIImageView!
    @IBOutlet weak var imgNoteIndicator: UIImageView!
    @IBOutlet weak var lblUserName: UILabel!
    @IBOutlet weak var lblUserDetail: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
        //showAnimation()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func setupUI() {
        super.setupUI()
        
        imgNoteIndicator.isHidden = true
        lblUserName.text = ""
        lblUserDetail.text = ""
        imgAvatar.image = #imageLiteral(resourceName: "no_profile")
        
        lblUserName.numberOfLines = 0
        lblUserDetail.numberOfLines = 2
    }
    
    func bindDetail(ofUser user: UserCDModel) {
        //hideAnimation()
        
        lblUserName.text = user.login
        lblUserDetail.text = user.note
        self.imgAvatar.circularView()
        imgNoteIndicator.isHidden = (user.note ?? "").trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
        
        lblUserName.textColor = !user.isReviewed ? .label : .gray
        lblUserDetail.textColor = !user.isReviewed ? .label : .gray
        
        imgNoteIndicator.tintColor = .label
    }
    
    /*
    func hideAnimation() {
        imgAvatar.isSkeletonable = false
        lblUserName.isSkeletonable = false
        lblUserDetail.isSkeletonable = false
        
        imgAvatar.hideSkeleton()
        lblUserName.hideSkeleton()
        lblUserDetail.hideSkeleton()
        
    }
    
    func showAnimation() {
        imgAvatar.isSkeletonable = true
        lblUserName.isSkeletonable = true
        lblUserDetail.isSkeletonable = true
        
        imgAvatar.showAnimatedGradientSkeleton()
        lblUserName.showAnimatedGradientSkeleton()
        lblUserDetail.showAnimatedGradientSkeleton()
    }
    */
}
