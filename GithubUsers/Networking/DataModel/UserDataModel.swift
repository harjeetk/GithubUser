//
//  UserDataModel.swift
//
//  Created by C100-105 on 15/03/21
//  Copyright (c) . All rights reserved.
//

import Foundation

struct UserDataModel: Codable {
    
    enum CodingKeys: String, CodingKey {
        case login
        case starredUrl = "starred_url"
        case gistsUrl = "gists_url"
        case nodeId = "node_id"
        case htmlUrl = "html_url"
        case url
        case avatarUrl = "avatar_url"
        case followingUrl = "following_url"
        case type
        case gravatarId = "gravatar_id"
        case reposUrl = "repos_url"
        case organizationsUrl = "organizations_url"
        case subscriptionsUrl = "subscriptions_url"
        case eventsUrl = "events_url"
        case receivedEventsUrl = "received_events_url"
        case siteAdmin = "site_admin"
        case followersUrl = "followers_url"
        case id
    }
    
    var login: String?
    var starredUrl: String?
    var gistsUrl: String?
    var nodeId: String?
    var htmlUrl: String?
    var url: String?
    var avatarUrl: String?
    var followingUrl: String?
    var type: String?
    var gravatarId: String?
    var reposUrl: String?
    var organizationsUrl: String?
    var subscriptionsUrl: String?
    var eventsUrl: String?
    var receivedEventsUrl: String?
    var siteAdmin: Bool?
    var followersUrl: String?
    var id: Int?
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        login = try container.decodeIfPresent(String.self, forKey: .login)
        starredUrl = try container.decodeIfPresent(String.self, forKey: .starredUrl)
        gistsUrl = try container.decodeIfPresent(String.self, forKey: .gistsUrl)
        nodeId = try container.decodeIfPresent(String.self, forKey: .nodeId)
        htmlUrl = try container.decodeIfPresent(String.self, forKey: .htmlUrl)
        url = try container.decodeIfPresent(String.self, forKey: .url)
        avatarUrl = try container.decodeIfPresent(String.self, forKey: .avatarUrl)
        followingUrl = try container.decodeIfPresent(String.self, forKey: .followingUrl)
        type = try container.decodeIfPresent(String.self, forKey: .type)
        gravatarId = try container.decodeIfPresent(String.self, forKey: .gravatarId)
        reposUrl = try container.decodeIfPresent(String.self, forKey: .reposUrl)
        organizationsUrl = try container.decodeIfPresent(String.self, forKey: .organizationsUrl)
        subscriptionsUrl = try container.decodeIfPresent(String.self, forKey: .subscriptionsUrl)
        eventsUrl = try container.decodeIfPresent(String.self, forKey: .eventsUrl)
        receivedEventsUrl = try container.decodeIfPresent(String.self, forKey: .receivedEventsUrl)
        siteAdmin = try container.decodeIfPresent(Bool.self, forKey: .siteAdmin)
        followersUrl = try container.decodeIfPresent(String.self, forKey: .followersUrl)
        id = try container.decodeIfPresent(Int.self, forKey: .id)
    }
    
    init() {
    }
}
