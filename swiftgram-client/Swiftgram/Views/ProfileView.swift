//
//  OwnProfileView.swift
//  Swiftgram
//
//  Created by Eliah Lohr on 25.09.22.
//

import SwiftUI

struct OthersProfileView: View {
    // These are set by hand via init for testing until we have server backend for this. Initiate new ones with type to remove the need for unwrapping
    private var isOurs: Bool = false    //we use this to determine which buttons to show
    private var userId: String = "not set"
    private var ownerName: String = "not set"
    private var isVerified: Bool = false
    private var ownerAvatarUrl: String = "not set"
    private var postCount: UInt16 = 0
    private var followerCount: UInt32 = 0
    private var followingCount: UInt32 = 0
    private var profileBio: String = "none" // profiles can be without bios!
    @State private var userIsFollowing: Bool = false
    
    let butler: Butler = Butler()
    
    //style variables
    let textSize: CGFloat = 15
    let avatarSize: CGFloat = 90

    // This constructor is for production.
    init(userId: String) {
        self.userId = userId
        // fetch userdata here
        // also check if the porfile is ours and set bool accordingly
    }

    // This init is for debugging, with hand set values
    init(isOurs: Bool, ownerName: String, isVerified: Bool, ownerAvatarUrl: String, postCount: UInt16, followerCount: UInt32, followingCount: UInt32, profileBio: String, userIsFollowing: Bool) {
        self.isOurs = isOurs
        self.ownerName = ownerName
        self.isVerified = isVerified
        self.ownerAvatarUrl = ownerAvatarUrl
        self.postCount = postCount
        self.followerCount = followerCount
        self.followingCount = followingCount
        self.profileBio = profileBio
        self.userIsFollowing = userIsFollowing
    }

    var body: some View {
        VStack {
            // this is the owner's name, badge and the follow button
            HStack {
                Text(ownerName).font(.system(size: textSize + 10, weight: .semibold))
                VerifiedCheckmark(isVerified: isVerified, size: textSize).padding(-3)
                Spacer()
                switch isOurs {
                case false:
                    Button(userIsFollowing ? "Follow" : "Following") {
                        userIsFollowing.toggle()
                    }.padding(.vertical, 4)
                        .padding(.horizontal, 8)
                        .background(
                            Rectangle()
                                .foregroundColor(Color("ContainerButtonBody"))
                                .cornerRadius(10))
                case true:
                    Button(action: {
                        // add link into settings panel here
                    }, label: {
                        Image(systemName: "gear")
                            .font(.system(size: textSize + 10))
                    })
                    
                }
            }.padding(15)

            // this HStack is the avatar image plus the stats
            HStack {
                // our profile owner avatar
                AsyncImage(url: URL(string: ownerAvatarUrl)) { image in
                    image.resizable()
                        .frame(width: avatarSize, height: avatarSize)
                        .clipShape(Capsule())
                        .padding(0)
                } placeholder: {
                    ProgressView()
                        .frame(width: avatarSize, height: avatarSize)
                        .clipShape(Capsule())
                        .progressViewStyle(CircularProgressViewStyle(tint: Color("ContainerText")))
                        .background(Capsule().foregroundColor(Color("AppBackground").opacity(0.3)))
                        .padding(0)
                }

                Spacer()
                
                VStack {
                    Text(butler.formatMetricUInt16(number: postCount))
                        .font(.system(size: textSize + 10, weight: .semibold))
                    Text(String("Posts")).font(.system(size: textSize))
                }

                Spacer()
                
                VStack {
                    Text(butler.formatMetricUInt32(number: followingCount))
                        .font(.system(size: textSize + 10, weight: .semibold))
                    Text(String("Following")).font(.system(size: textSize))
                }

                Spacer()
                
                VStack {
                    Text(String(butler.formatMetricUInt32(number: followerCount)))
                        .font(.system(size: textSize + 10, weight: .semibold))
                    Text(String("Follower")).font(.system(size: textSize))
                }

                Spacer()

            }.padding(.horizontal, 15).padding(.top, -5)

            //Profile bio. We hardcode isVerified to false because of this
            Comment(publisherName: ownerName, content: profileBio)
            
            //Post History
            let columns = [
                GridItem(.adaptive(minimum: 100), spacing: 0)
                ]

            ScrollView {
                LazyVGrid(columns: columns, alignment: .center, spacing: 15) {
                    ProfileImageTile(contentUrl: "https://i.ibb.co/thp8tmS/temple.jpg")
                    ProfileImageTile(contentUrl: "https://i.ibb.co/3rmGmdC/skyline.png")
                    ProfileImageTile(contentUrl: "https://i.ibb.co/RHZBNG8/bikes.png")
                    ProfileImageTile(contentUrl: "https://i.ibb.co/bKX0knS/leafes.png")
                    ProfileImageTile(contentUrl: "https://i.ibb.co/pRv8Nm6/river.png")
                }.padding(10)
            }
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
        OthersProfileView(isOurs: false, ownerName: "Si Luan Pham", isVerified: true, ownerAvatarUrl: "https://i.ibb.co/tDGTXmK/profile-picture.jpg", postCount: 5, followerCount: 2000000, followingCount: 342, profileBio: "Hi I'm Si Luan Pham, and this is my mockup profile description!", userIsFollowing: true)
    }
}
