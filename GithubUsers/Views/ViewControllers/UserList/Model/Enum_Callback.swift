//
//  Enum_Callback.swift
//  GithubUsers
//
//  Created by C100-105 on 15/03/21.
//

import Foundation

enum Enum_UserListViewModelCallback {
    case none
    case bindItems(items: [UserDataModel], isPullRefresh: Bool)
    case noItemFound
    case fetchLocalItems
}

enum Enum_UserListDataSourceCallback {
    case none
    case callLoadMore(forOffset: Int)
    case navigateToDetails(user: UserCDModel)
}
