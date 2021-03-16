//
//  UserDetailDataModel.swift
//
//  Created by C100-105 on 15/03/21
//  Copyright (c) . All rights reserved.
//

import Foundation

struct UserDetailDataModel: Codable {
    
    enum CodingKeys: String, CodingKey {
        case blog
        case type
        case login
        case followersUrl = "followers_url"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case avatarUrl = "avatar_url"
        case followers
        case organizationsUrl = "organizations_url"
        case id
        case reposUrl = "repos_url"
        case siteAdmin = "site_admin"
        case publicRepos = "public_repos"
        case followingUrl = "following_url"
        case gravatarId = "gravatar_id"
        case url
        case gistsUrl = "gists_url"
        case receivedEventsUrl = "received_events_url"
        case htmlUrl = "html_url"
        case eventsUrl = "events_url"
        case following
        case nodeId = "node_id"
        case publicGists = "public_gists"
        case starredUrl = "starred_url"
        case subscriptionsUrl = "subscriptions_url"
        case company
    }
    
    var blog: String?
    var createdAt: String?
    var updatedAt: String?
    var followers: Int?
    var publicRepos: Int?
    var following: Int?
    var publicGists: Int?
    var company: String?
    
    var url: String?
    var starredUrl: String?
    var subscriptionsUrl: String?
    var type: String?
    var login: String?
    var followersUrl: String?
    var avatarUrl: String?
    var organizationsUrl: String?
    var id: Int?
    var reposUrl: String?
    var siteAdmin: Bool?
    var followingUrl: String?
    var gravatarId: String?
    var gistsUrl: String?
    var receivedEventsUrl: String?
    var htmlUrl: String?
    var eventsUrl: String?
    var nodeId: String?
    
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        blog = try container.decodeIfPresent(String.self, forKey: .blog)
        type = try container.decodeIfPresent(String.self, forKey: .type)
        login = try container.decodeIfPresent(String.self, forKey: .login)
        followersUrl = try container.decodeIfPresent(String.self, forKey: .followersUrl)
        createdAt = try container.decodeIfPresent(String.self, forKey: .createdAt)
        updatedAt = try container.decodeIfPresent(String.self, forKey: .updatedAt)
        avatarUrl = try container.decodeIfPresent(String.self, forKey: .avatarUrl)
        followers = try container.decodeIfPresent(Int.self, forKey: .followers)
        organizationsUrl = try container.decodeIfPresent(String.self, forKey: .organizationsUrl)
        id = try container.decodeIfPresent(Int.self, forKey: .id)
        reposUrl = try container.decodeIfPresent(String.self, forKey: .reposUrl)
        siteAdmin = try container.decodeIfPresent(Bool.self, forKey: .siteAdmin)
        publicRepos = try container.decodeIfPresent(Int.self, forKey: .publicRepos)
        followingUrl = try container.decodeIfPresent(String.self, forKey: .followingUrl)
        gravatarId = try container.decodeIfPresent(String.self, forKey: .gravatarId)
        url = try container.decodeIfPresent(String.self, forKey: .url)
        gistsUrl = try container.decodeIfPresent(String.self, forKey: .gistsUrl)
        receivedEventsUrl = try container.decodeIfPresent(String.self, forKey: .receivedEventsUrl)
        htmlUrl = try container.decodeIfPresent(String.self, forKey: .htmlUrl)
        eventsUrl = try container.decodeIfPresent(String.self, forKey: .eventsUrl)
        following = try container.decodeIfPresent(Int.self, forKey: .following)
        nodeId = try container.decodeIfPresent(String.self, forKey: .nodeId)
        publicGists = try container.decodeIfPresent(Int.self, forKey: .publicGists)
        starredUrl = try container.decodeIfPresent(String.self, forKey: .starredUrl)
        subscriptionsUrl = try container.decodeIfPresent(String.self, forKey: .subscriptionsUrl)
        company = try container.decodeIfPresent(String.self, forKey: .company)
    }
    
    init() {
    }
}
