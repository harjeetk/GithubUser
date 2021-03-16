//
//  CoreDBAdaptor.swift
//  NISLGroupChat
//
//  Created by C100-136 on 10/05/19.
//  Copyright © 2019 Narola. All rights reserved.
//

import UIKit
import CoreData
import Foundation

class CoreDBAdaptor: NSObject {
    
    static let sharedDataAdaptor = CoreDBAdaptor()
    var managedContext = CoreDBManager.sharedDatabase.persistentContainer.viewContext
    
    
    //MARK: - User list
    func saveOrUpdateUsersList(items: [UserDataModel]) {
        
        for item in items {
            
            guard let id = item.id else {
                continue
            }
            let arrayUsers = fetchUserListItemWhere(id: id)
            let arrayUserDetails = fetchUserDetailsWhere(id: id)
            
            var userCDModel = UserCDModel()
            var userDetailCDModel = UserDetailCDModel()
            
            if let user = arrayUsers.first {
                userCDModel = user
            } else{
                userCDModel = UserCDModel(entity: UserCDModel.entity(), insertInto: managedContext)
            }
            
            if let user = arrayUserDetails.first {
                userDetailCDModel = user
            } else{
                userDetailCDModel = UserDetailCDModel(entity: UserDetailCDModel.entity(), insertInto: managedContext)
            }
            
            userCDModel.login = item.login
            userCDModel.starredUrl = item.starredUrl
            userCDModel.gistsUrl = item.gistsUrl
            userCDModel.nodeId = item.nodeId
            userCDModel.htmlUrl = item.htmlUrl
            userCDModel.url = item.url
            userCDModel.avatarUrl = item.avatarUrl
            userCDModel.followingUrl = item.followingUrl
            userCDModel.type = item.type
            userCDModel.gravatarId = item.gravatarId
            userCDModel.reposUrl = item.reposUrl
            userCDModel.organizationsUrl = item.organizationsUrl
            userCDModel.subscriptionsUrl = item.subscriptionsUrl
            userCDModel.eventsUrl = item.eventsUrl
            userCDModel.receivedEventsUrl = item.receivedEventsUrl
            userCDModel.siteAdmin = item.siteAdmin ?? false
            userCDModel.followersUrl = item.followersUrl
            userCDModel.id = Int16(item.id ?? 0)
            
            userDetailCDModel.login = item.login
            userDetailCDModel.starredUrl = item.starredUrl
            userDetailCDModel.gistsUrl = item.gistsUrl
            userDetailCDModel.nodeId = item.nodeId
            userDetailCDModel.htmlUrl = item.htmlUrl
            userDetailCDModel.url = item.url
            userDetailCDModel.avatarUrl = item.avatarUrl
            userDetailCDModel.followingUrl = item.followingUrl
            userDetailCDModel.type = item.type
            userDetailCDModel.gravatarId = item.gravatarId
            userDetailCDModel.reposUrl = item.reposUrl
            userDetailCDModel.organizationsUrl = item.organizationsUrl
            userDetailCDModel.subscriptionsUrl = item.subscriptionsUrl
            userDetailCDModel.eventsUrl = item.eventsUrl
            userDetailCDModel.receivedEventsUrl = item.receivedEventsUrl
            userDetailCDModel.siteAdmin = item.siteAdmin ?? false
            userDetailCDModel.followersUrl = item.followersUrl
            userDetailCDModel.id = Int16(item.id ?? 0)
            
            CoreDBManager.sharedDatabase.saveContext()
        }
    }
    
    func saveOrUpdateUsersDetails(item: UserDetailDataModel) {
        guard let id = item.id else {
            return
        }
        let arrayUsers = fetchUserListItemWhere(id: id)
        let arrayUserDetails = fetchUserDetailsWhere(id: id)
        
        var userCDModel = UserCDModel()
        var userDetailCDModel = UserDetailCDModel()
        
        if let user = arrayUsers.first {
            userCDModel = user
        } else {
            userCDModel = UserCDModel(entity: UserCDModel.entity(), insertInto: managedContext)
        }
        
        if let user = arrayUserDetails.first {
            userDetailCDModel = user
        } else {
            userDetailCDModel = UserDetailCDModel(entity: UserDetailCDModel.entity(), insertInto: managedContext)
        }
        
        userCDModel.login = item.login
        userCDModel.starredUrl = item.starredUrl
        userCDModel.gistsUrl = item.gistsUrl
        userCDModel.nodeId = item.nodeId
        userCDModel.htmlUrl = item.htmlUrl
        userCDModel.url = item.url
        userCDModel.avatarUrl = item.avatarUrl
        userCDModel.followingUrl = item.followingUrl
        userCDModel.type = item.type
        userCDModel.gravatarId = item.gravatarId
        userCDModel.reposUrl = item.reposUrl
        userCDModel.organizationsUrl = item.organizationsUrl
        userCDModel.subscriptionsUrl = item.subscriptionsUrl
        userCDModel.eventsUrl = item.eventsUrl
        userCDModel.receivedEventsUrl = item.receivedEventsUrl
        userCDModel.siteAdmin = item.siteAdmin ?? false
        userCDModel.followersUrl = item.followersUrl
        userCDModel.id = Int16(item.id ?? 0)
        userCDModel.isReviewed = true
        
        userDetailCDModel.blog = item.blog
        userDetailCDModel.createdAt = item.createdAt
        userDetailCDModel.updatedAt = item.updatedAt
        userDetailCDModel.followers = Int16(item.followers ?? 0)
        userDetailCDModel.publicRepos = Int16(item.publicRepos ?? 0)
        userDetailCDModel.following = Int16(item.following ?? 0)
        userDetailCDModel.publicGists = Int16(item.publicGists ?? 0)
        userDetailCDModel.company = item.company
        
        userDetailCDModel.login = item.login
        userDetailCDModel.starredUrl = item.starredUrl
        userDetailCDModel.gistsUrl = item.gistsUrl
        userDetailCDModel.nodeId = item.nodeId
        userDetailCDModel.htmlUrl = item.htmlUrl
        userDetailCDModel.url = item.url
        userDetailCDModel.avatarUrl = item.avatarUrl
        userDetailCDModel.followingUrl = item.followingUrl
        userDetailCDModel.type = item.type
        userDetailCDModel.gravatarId = item.gravatarId
        userDetailCDModel.reposUrl = item.reposUrl
        userDetailCDModel.organizationsUrl = item.organizationsUrl
        userDetailCDModel.subscriptionsUrl = item.subscriptionsUrl
        userDetailCDModel.eventsUrl = item.eventsUrl
        userDetailCDModel.receivedEventsUrl = item.receivedEventsUrl
        userDetailCDModel.siteAdmin = item.siteAdmin ?? false
        userDetailCDModel.followersUrl = item.followersUrl
        userDetailCDModel.id = Int16(item.id ?? 0)
        
        CoreDBManager.sharedDatabase.saveContext()
    }
    
    func fetchUserListItemWhere(id: Int, sort:[NSSortDescriptor] = [], limit:Int = 0) -> [UserCDModel] {
        let predicate = NSPredicate(format: "id = %d", id)
        var arrayObjConversation:[UserCDModel] = []
        let fetchRequest: NSFetchRequest<UserCDModel> = UserCDModel.fetchRequest()
        fetchRequest.predicate = predicate
        (limit != 0) ? (fetchRequest.fetchLimit = limit) : nil
        (sort.count != 0) ? (fetchRequest.sortDescriptors = sort) : nil
        do {
            arrayObjConversation = (try managedContext.fetch(fetchRequest))
        } catch {
            print("Cannot fetch")
        }
        return arrayObjConversation
    }
    
    func fetchUserDetailsWhere(id: Int, sort:[NSSortDescriptor] = [], limit:Int = 0) -> [UserDetailCDModel] {
        let predicate = NSPredicate(format: "id = %d", id)
        var arrayObjConversation:[UserDetailCDModel] = []
        let fetchRequest: NSFetchRequest<UserDetailCDModel> = UserDetailCDModel.fetchRequest()
        fetchRequest.predicate = predicate
        (limit != 0) ? (fetchRequest.fetchLimit = limit) : nil
        (sort.count != 0) ? (fetchRequest.sortDescriptors = sort) : nil
        do {
            arrayObjConversation = (try managedContext.fetch(fetchRequest))
        } catch {
            print("Cannot fetch")
        }
        return arrayObjConversation
    }
    
    func fetchAllUsersList(ofItems: [UserDataModel]) -> [UserCDModel] {
        
        let fetchRequest: NSFetchRequest<UserCDModel> = UserCDModel.fetchRequest()
        
        if ofItems.count > 0 {
            var ids = ofItems.map {
                return $0.id ?? 0
            }.filter {
                return $0 > 0
            }
            ids.removeDuplicates()
            print("===>", ids)
            
            let strIds = ids.map {
                return $0.description
            }
            let predicate = NSPredicate(format: "id IN %@", strIds)
            
            fetchRequest.predicate = predicate
        }
        
        var array: [UserCDModel] = []
        do {
            array = (try managedContext.fetch(fetchRequest))
        } catch {
            print("Cannot fetch")
        }
        return array
    }
}
