//
//  ViewModel.swift
//
//  Created by C100-105 on 22/03/20.
//  Copyright © 2020 Narola. All rights reserved.
//

import Foundation

class UserDetailViewModel: BaseViewModel {
    
    var callbackFor: Dynamic<Enum_UserDetailViewModelCallback> = Dynamic(.none)
    var userDetails: UserCDModel?
    
    // MARK: - Init
    override init() {
        super.init()
    }
    
    func fetchUserDetailsFromLocal() {
        if let id = userDetails?.id, let userCDModel = CoreDBAdaptor.sharedDataAdaptor.fetchUserDetailsWhere(id: Int(id)).first {
            self.callbackFor.value = .bindDetails(ofUser: userCDModel)
        }
        fetchUserDetails()
    }
    
    private func fetchUserDetails() {
        guard let userName = userDetails?.login else {
            return
        }
        let urlString = "https://api.github.com/users/" + userName
        
        apiManager.call(api: urlString) { (res: Swift.Result<UserDetailDataModel, AlertMessage>) in
            switch res {
            case .success(let user):
                CoreDBAdaptor.sharedDataAdaptor.saveOrUpdateUsersDetails(item: user)
                if let id = user.id, let userCDModel = CoreDBAdaptor.sharedDataAdaptor.fetchUserDetailsWhere(id: id).first {
                    return self.callbackFor.value = .bindDetails(ofUser: userCDModel)
                }
                return self.callbackFor.value = .none
                
            case .failure(let msg):
                return self.alertMessage.value = msg
            }
        }
    }
}
