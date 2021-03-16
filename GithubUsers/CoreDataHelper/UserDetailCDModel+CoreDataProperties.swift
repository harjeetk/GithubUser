//
//  UserDetailCDModel+CoreDataProperties.swift
//  GithubUsers
//
//  Created by C100-105 on 15/03/21.
//

import Foundation
import CoreData


extension UserDetailCDModel {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<UserDetailCDModel> {
        return NSFetchRequest<UserDetailCDModel>(entityName: "UserDetailCDModel")
    }

    @NSManaged public var avatarUrl: String?
    @NSManaged public var blog: String?
    @NSManaged public var company: String?
    @NSManaged public var createdAt: String?
    @NSManaged public var eventsUrl: String?
    @NSManaged public var followers: Int16
    @NSManaged public var followersUrl: String?
    @NSManaged public var following: Int16
    @NSManaged public var followingUrl: String?
    @NSManaged public var gistsUrl: String?
    @NSManaged public var gravatarId: String?
    @NSManaged public var htmlUrl: String?
    @NSManaged public var id: Int16
    @NSManaged public var login: String?
    @NSManaged public var nodeId: String?
    @NSManaged public var organizationsUrl: String?
    @NSManaged public var publicGists: Int16
    @NSManaged public var publicRepos: Int16
    @NSManaged public var receivedEventsUrl: String?
    @NSManaged public var reposUrl: String?
    @NSManaged public var siteAdmin: Bool
    @NSManaged public var starredUrl: String?
    @NSManaged public var subscriptionsUrl: String?
    @NSManaged public var type: String?
    @NSManaged public var updatedAt: String?
    @NSManaged public var url: String?

}
