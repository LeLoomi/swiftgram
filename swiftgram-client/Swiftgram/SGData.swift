//
//  SGData.swift
//  Swiftgram
//
//  Created by Eliah Lohr on 11.11.22.
//
//  This class is our JSON prefabs
//

import Foundation
import SwiftUI

struct SGImagePostData: Codable {
    var contentID: String
    var publisherID: String
    var imageURL: String
    var postDescription: String
    var likeCount: UInt32
    var latitude: Double
    var longitude: Double
    var commentchaiID: String
}

struct SGUserProfile: Codable {
    var contentID: String
    var publicName: String
    var avatarURL: String
    var postCount: UInt16
    var followerCount: Int16
    var followingCount: Int16
    var bio: String
    var isFollowed: Bool // Are we following?
    var isFollowing: Bool // Is he following us?
}

struct SGUserQuickInfo: Codable {
    var contentID: String
    var publicName: String
    var avatarURL: String
    var isFollowed: Bool // Are we following?
    var isFollowing: Bool // Is he following us?
}

struct SGCommentData: Codable {
    var contentID: String
    var authorID: String
    var payload: String
}

struct SGCommentChainData: Codable {
    var contentID: String
    var commentsCount: UInt32
    var payload: [SGCommentData] = []
}
