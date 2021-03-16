//
//  Datasource.swift
//
//  Created by C100-105 on 22/03/20.
//  Copyright © 2020 Narola. All rights reserved.
//

import UIKit

class UserDetailDatasource: BaseDataSource {
    
    var callbackFor: Dynamic<Enum_UserDetailDataSourceCallback> = Dynamic(.none)
    var userDetail: UserDetailCDModel?
    var userListDetail: UserCDModel?
    
    enum Enum_UserDetailRow: Int {
        case image = 0
        case information
        case notes
        case save
        
        static let total: Int = {
            var max = 0
            while let _ = Enum_UserDetailRow(rawValue: max) { max += 1 }
            return max
        }()
    }
    
    override init() {
        super.init()
    }
    
}

// MARK: - UITableViewDelegate, UITableViewDataSource
extension UserDetailDatasource: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        guard let rowType = Enum_UserDetailRow(rawValue: indexPath.row) else {
            return 0
        }
        switch rowType {
        case .image:
            return 250
        case .information, .notes, .save:
            return UITableView.automaticDimension
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Enum_UserDetailRow.total
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let rowType = Enum_UserDetailRow(rawValue: indexPath.row) else {
            return .defaultCell
        }
        switch rowType {
        case .image:
            let cell = tableView.dequeueReusableCell(withIdentifier: ImageTableViewCell.identifier, for: indexPath) as! ImageTableViewCell
            cell.setupUI()
            cell.imgView.setWebImage(url: userDetail?.avatarUrl ?? userListDetail?.avatarUrl, placeholder: .noDataImage) { _ in
                
            }
            return cell
            
        case .information:
            let cell = tableView.dequeueReusableCell(withIdentifier: UserInfoTableViewCell.identifier, for: indexPath) as! UserInfoTableViewCell
            cell.setupUI()
            cell.lblName.text = "name: " + (userDetail?.login ?? userListDetail?.login ?? "")
            cell.lblCompany.text = "company: " + (userDetail?.company ?? "")
            cell.lblBlog.text = "blog: " + (userDetail?.blog ?? "")
            
            cell.lblFollowers.text = "follower: " + (userDetail?.followers ?? 0).description
            cell.lblFollowing.text = "following: " + (userDetail?.following ?? 0).description
            return cell
            
        case .notes:
            let cell = tableView.dequeueReusableCell(withIdentifier: TextViewTableViewCell.identifier, for: indexPath) as! TextViewTableViewCell
            cell.setupUI()
            cell.textView.text = userListDetail?.note
            return cell
        case .save:
            let cell = tableView.dequeueReusableCell(withIdentifier: ButtonTableViewCell.identifier, for: indexPath) as! ButtonTableViewCell
            cell.setupUI()
            cell.callbackSaveClicked = {
                self.callbackFor.value = .saveNote
            }
            return cell
        }
    }
}
