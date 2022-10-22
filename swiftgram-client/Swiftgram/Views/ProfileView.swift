//
//  OwnProfileView.swift
//  Swiftgram
//
//  Created by Eliah Lohr on 25.09.22.
//

import SwiftUI

struct OthersProfileView: View {
    // These are set by hand via init for testing until we have server backend for this. Initiate new ones with type to remove the need for unwrapping
    private var isOurs: Bool = false
    private var userId: String = "not set"
    private var ownerName: String = "not set"
    private var ownerAvatarUrl: String = "not set"
    private var postCount: UInt8 = 0
    private var followerCount: UInt8 = 0
    private var followingCount: UInt8 = 0
    private var profileBio: String = "none" // profiles can not have bios!
    @State var userIsFollowing: Bool = false

    // This constructor is for production.
    init(userId: String) {
        self.userId = userId
        // fetch userdata here
        // also check if the porfile is ours and set bool accordingly
    }

    // This init is for debugging, with hand set values
    init(ownerName: String, ownerAvatarUrl: String, postCount: UInt8, followerCount: UInt8, followingCount: UInt8, profileBio: String, userIsFollowing: Bool, isOurs:Bool) {
        self.isOurs = isOurs
        self.ownerName = ownerName
        self.ownerAvatarUrl = ownerAvatarUrl
        self.postCount = postCount
        self.followerCount = followerCount
        self.followingCount = followingCount
        self.profileBio = profileBio
        self.userIsFollowing = userIsFollowing
    }

    var body: some View {
        VStack {
            // this is the owner's name and the follow button
            HStack {
                Text(ownerName).font(.system(size: 25, weight: .semibold))
                Spacer()
                if(isOurs == false) {
                    Button(userIsFollowing ? "Follow" : "Following") {
                        userIsFollowing.toggle()
                    }.padding(.vertical, 4)
                        .padding(.horizontal, 8)
                        .background(
                            Rectangle()
                                .foregroundColor(Color("ContainerButtonBody"))
                                .cornerRadius(10))
                }

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

            //Profile bio
            Comment(publisherName: ownerName, content: profileBio)
            
            //Post History
            let columns = [
                GridItem(.adaptive(minimum: 100), spacing: 0)
                ]
            
            ScrollView {
                LazyVGrid(columns: columns, alignment: .center, spacing: 15) {
                    ProfileImageTile(contentUrl: "https://i.ibb.co/thp8tmS/temple.jpg")
                    ProfileImageTile(contentUrl: "https://i.ibb.co/thp8tmS/temple.jpg")
                    ProfileImageTile(contentUrl: "https://i.ibb.co/thp8tmS/temple.jpg")
                    ProfileImageTile(contentUrl: "https://i.ibb.co/thp8tmS/temple.jpg")
                    ProfileImageTile(contentUrl: "https://i.ibb.co/thp8tmS/temple.jpg")
                }.padding(10)
            }

            
            Divider()
            
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

struct OthersProfileView_Previews: PreviewProvider {
    static var previews: some View {
        OthersProfileView(ownerName: "Si Luan Pham", ownerAvatarUrl: "https://i.ibb.co/tDGTXmK/profile-picture.jpg", postCount: 8, followerCount: 76, followingCount: 92, profileBio: "Hi I'm Si Luan Pham, and this is my mockup profile description!", userIsFollowing: true, isOurs: true)
    }
}
