//
//  JsonAgent.swift
//  Swiftgram
//
//  Created by Eliah Lohr on 11.11.22.
//
//  This class is our handler for JSON en-/decoding
//

import Foundation

let encoder = JSONEncoder()
let decoder = JSONDecoder()

struct JsonAgent {
    public func decodeProfile(response: String) -> SGUserProfile {
        let data = response.data(using: .utf8)!
        do {
            let product = try decoder.decode(SGUserProfile.self, from: data)
            print("Decode successful!!!")
            return product
        } catch {
            print("JsonAgent: \(error)")
        }

        return SGUserProfile(contentID: "DECODE FAILED", publicName: "user profile", avatarURL: "", postCount: 0, followerCount: 0, followingCount: 0, bio: "", isFollowed: false, isFollowing: false)
    }

    public func decodeQuickProfile(response: String) -> SGUserQuickInfo {
        let data = response.data(using: .utf8)!
        do {
            let product = try decoder.decode(SGUserQuickInfo.self, from: data)
            print("Decode successful!!!")
            return product
        } catch {
            print("JsonAgent: \(error)")
        }

        return SGUserQuickInfo(contentID: "DECODE FAILED", publicName: "quick info", avatarURL: "", isFollowed: false, isFollowing: false)
    }

    public func decodeImagePost(response: String) -> SGImagePostData {
        let data = response.data(using: .utf8)!
        do {
            let product = try decoder.decode(SGImagePostData.self, from: data)
            print("Decode successful!!!")
            return product
        } catch {
            print("JsonAgent: \(error)")
        }

        return SGImagePostData(contentID: "DECODE FAILED", publisherID: "post data", imageURL: "", postDescription: "", likeCount: 0, latitude: 0, longitude: 0, commentchaiID: "")
    }

    public func decodeComment(response: String) -> SGCommentData {
        let data = response.data(using: .utf8)!
        do {
            let product = try decoder.decode(SGCommentData.self, from: data)
            print("Decode successful!!!")
            return product
        } catch {
            print("JsonAgent: \(error)")
        }

        return SGCommentData(contentID: "DECODE FAILED", authorID: "comment data", payload: "")
    }
}
