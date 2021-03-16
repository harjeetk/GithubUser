//
//  Enum_UserDetailCallback.swift
//  GithubUsers
//
//  Created by C100-105 on 15/03/21.
//

import Foundation

enum Enum_UserDetailViewModelCallback {
    case none
    case reloadData
    case bindDetails(ofUser: UserDetailCDModel)
}

enum Enum_UserDetailDataSourceCallback {
    case none
    case reloadData
    case saveNote
}
