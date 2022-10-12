//
//  OwnProfileView.swift
//  Swiftgram
//
//  Created by Eliah Lohr on 25.09.22.
//

import SwiftUI

struct OwnProfileView: View {
    // These are set by hand via init for testing until we have server backend for this. Initiate new ones with type to remove the need for unwrapping
    var userId: String = "not set"
    var ownerName: String = "not set"
    var ownerAvatarUrl: String = "not set"
    var postCount: UInt8 = 0
    var followerCount: UInt8 = 0
    var followingCount: UInt8 = 0
    var profileBio: String = "none" // profiles can not have bios!

    // This constructor is for production.
    init(userId: String) {
        self.userId = userId
        // fetch userdata here
    }

    // This init is for debugging, with hand set values
    init(ownerName: String, ownerAvatarUrl: String, postCount: UInt8, followerCount: UInt8, followingCount: UInt8, profileBio: String) {
        self.ownerName = ownerName
        self.ownerAvatarUrl = ownerAvatarUrl
        self.postCount = postCount
        self.followerCount = followerCount
        self.followingCount = followingCount
        self.profileBio = profileBio
    }

    var body: some View {
        VStack {
            // this is the owner's name
            HStack {
                Text(ownerName).font(.system(size: 25, weight: .semibold))
                Spacer()
            }.padding(15)

            // this HStack is the avatar image plus the stats
            HStack {
                // our profile owner avatar
                AsyncImage(url: URL(string: ownerAvatarUrl)) { image in
                    image.resizable()
                        .frame(width: 90, height: 90)
                        .clipShape(Capsule())
                        .padding(0)
                } placeholder: {
                    ProgressView()
                        .frame(width: 90, height: 90)
                        .clipShape(Capsule())
                        .progressViewStyle(CircularProgressViewStyle(tint: Color("ContainerText")))
                        .background(Capsule().foregroundColor(Color("AppBackground").opacity(0.3)))
                        .padding(0)
                }

                Spacer()
                VStack {
                    Text(String(postCount)).font(.system(size: 25, weight: .semibold))
                    Text(String("Posts")).font(.system(size: 15))
                }

                Spacer()
                VStack {
                    Text(String(followingCount)).font(.system(size: 25, weight: .semibold))
                    Text(String("Following")).font(.system(size: 15))
                }

                Spacer()
                VStack {
                    Text(String(followerCount)).font(.system(size: 25, weight: .semibold))
                    Text(String("Follower")).font(.system(size: 15))
                }

                Spacer()

            }.padding(.horizontal, 15).padding(.top, -5)

            Comment(publisherName: ownerName, content: profileBio)

            // Post History Grid goes here
            Grid {}

            Spacer() // REMOVE AFTER UI BUILING
        }
        .foregroundColor(Color("ContainerText"))
        .padding(.bottom, 25)
        .frame(width: 370, alignment: .top)
        .background(alignment: .top) {
            Rectangle() // as long as paddings (.trailing/.vertical) are set correctly, the background will auto scale
                .foregroundColor(Color("ContainerBackground"))
                .cornerRadius(15)
        }
    }
}

struct OwnProfileView_Previews: PreviewProvider {
    static var previews: some View {
        OwnProfileView(ownerName: "Si Luan Pham", ownerAvatarUrl: "https://i.ibb.co/tDGTXmK/profile-picture.jpg", postCount: 8, followerCount: 76, followingCount: 92, profileBio: "Hi I'm Si Luan Pham, and this is my mockup profile description!")
    }
}
