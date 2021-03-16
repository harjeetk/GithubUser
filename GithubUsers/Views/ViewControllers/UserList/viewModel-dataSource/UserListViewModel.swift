//
//  ViewModel.swift
//
//  Created by C100-105 on 22/03/20.
//  Copyright © 2020 Narola. All rights reserved.
//

import Foundation

class UserListViewModel: BaseViewModel {
    
    var callbackFor: Dynamic<Enum_UserListViewModelCallback> = Dynamic(.none)
    var isAllowLoadMore = true
    
    // MARK: - Init
    override init() {
        super.init()
        
    }
    
    func fetchUserList(isPullToRefresh: Bool, offset: Int) {
        if !isAllowLoadMore {
            return callbackFor.value = .none
        }
        self.isAllowLoadMore = false
        let urlString = "https://api.github.com/users?since=" + offset.description
        print("===>", urlString)
        
        if !isPullToRefresh {
            self.isLoaderHidden.value = false
        }
        apiManager.call(api: urlString) { (res: Swift.Result<[UserDataModel], AlertMessage>) in
            self.isLoaderHidden.value = true
            
            switch res {
            case .success(let items):
                self.isAllowLoadMore = items.count > 0
                CoreDBAdaptor.sharedDataAdaptor.saveOrUpdateUsersList(items: items)
                return self.callbackFor.value = .bindItems(items: items, isPullRefresh: isPullToRefresh)
                
            case .failure(let msg):
                self.callbackFor.value = .fetchLocalItems
                return self.alertMessage.value = msg
            }
        }
    }
}
