//
//  Datasource.swift
//
//  Created by C100-105 on 22/03/20.
//  Copyright © 2020 Narola. All rights reserved.
//

import UIKit

class UserListDatasource: BaseDataSource {
    
    var callbackFor: Dynamic<Enum_UserListDataSourceCallback> = Dynamic(.none)
    
    var userList: [UserCDModel] = []
    
    var isAllowLoadMore = true
    
    override init() {
        super.init()
    }
    
    func append(items: [UserCDModel], isAllowLoadMore: Bool) {
        self.isAllowLoadMore = isAllowLoadMore
        self.userList = items
    }
    
}

// MARK: - UITableViewDelegate, UITableViewDataSource
extension UserListDatasource: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard userList.count > 0 else {
            return
        }
        let currentRow = indexPath.row
        let count = userList.count
        
        let isLastCell = count - currentRow == 1
        let minY = tableView.contentOffset.y
        
        if isLastCell && minY > 0 && isAllowLoadMore, let lastUserId = userList.last?.id {
            isAllowLoadMore = false
            callbackFor.value = .callLoadMore(forOffset: Int(lastUserId))
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard userList.count > 0 else {
            return 0
        }
        return userList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: UserDetailTableViewCell.identifier, for: indexPath) as! UserDetailTableViewCell
        
        guard userList.count > 0 else {
            //cell.showAnimation()
            return cell
        }
        let user = userList[indexPath.row]
        cell.bindDetail(ofUser: user)
        cell.imgAvatar.setWebImage(url: user.avatarUrl, placeholder: .noDataImage) { image in
            cell.imgAvatar.circularView()
            if indexPath.row % 4 == 3 {
                cell.imgAvatar.image = image?.inverseImage(cgResult: false)
            }
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        guard userList.count > 0 else {
            return
        }
        let user = userList[indexPath.row]
        callbackFor.value = .navigateToDetails(user: user)
    }
}
extension UIImage {
    func inverseImage(cgResult: Bool) -> UIImage? {
        let coreImage = UIKit.CIImage(image: self)
        guard let filter = CIFilter(name: "CIColorInvert") else { return nil }
        filter.setValue(coreImage, forKey: kCIInputImageKey)
        guard let result = filter.value(forKey: kCIOutputImageKey) as? UIKit.CIImage else { return nil }
        if cgResult { // I've found that UIImage's that are based on CIImages don't work with a lot of calls properly
            return UIImage(cgImage: CIContext(options: nil).createCGImage(result, from: result.extent)!)
        }
        return UIImage(ciImage: result)
    }
}
