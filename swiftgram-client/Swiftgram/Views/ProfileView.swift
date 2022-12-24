//
//  OwnProfileView.swift
//  Swiftgram
//
//  Created by Eliah Lohr on 25.09.22.
//

import SwiftUI

struct ProfileView: View {
    // These are set by hand via init for testing until we have server backend for this. Initiate new ones with type to remove the need for unwrapping
    private var isOurs: Bool = false // we use this to determine which buttons to show
    private var userId: String = "not set"
    private var ownerName: String = "not set"
    private var isVerified: Bool = false
    private var ownerAvatarUrl: String = "not set"
    private var postCount: UInt16 = 0
    private var followerCount: UInt32 = 0
    private var followingCount: UInt32 = 0
    private var privateProfile: Bool = false
    private var profileBio: String = "none" // profiles can be without bios!
    
    @State private var userIsFollowing: Bool = false
    @State var showSettingsPopover = false
    @State var showPrivateProfilePopover = false
    
    @AppStorage("AppTheme") private var appTheme = "BaseTheme"
    let butler: Butler = .init() // We use our butler for number formatting

    // local style variables
    let textSize: CGFloat = 15
    let avatarSize: CGFloat = 90

    // This constructor is for production.
    init(userId: String) {
        self.userId = userId
        // fetch and set userdata here
        // also check if the porfile is ours and set bool accordingly
    }

    // This init is for debugging, with hand set values
    init(isOurs: Bool, ownerName: String, isVerified: Bool, ownerAvatarUrl: String, postCount: UInt16, followerCount: UInt32, followingCount: UInt32, profileBio: String, userIsFollowing: Bool, privateProfile: Bool) {
        self.isOurs = isOurs
        self.ownerName = ownerName
        self.isVerified = isVerified
        self.ownerAvatarUrl = ownerAvatarUrl
        self.postCount = postCount
        self.followerCount = followerCount
        self.followingCount = followingCount
        self.profileBio = profileBio
        self.userIsFollowing = userIsFollowing
        self.privateProfile = privateProfile
    }

    var body: some View {
        VStack {
            // this is the owner's name, badge, locked profile indicator and the follow button / settings link
            HStack {
                Text(ownerName).font(.system(size: textSize + 10, weight: .semibold))
                    .padding(.trailing, -3)
                
                VerifiedCheckmark(isVerified: isVerified, size: textSize)
                    .padding(.trailing, -3)
                
                // Our lock in case the profile is set to private
                if (privateProfile) {
                    Button(action: {
                        showPrivateProfilePopover = true
                    }, label: {
                        Image(systemName: "lock")
                            .font(.system(size: textSize))
                            .foregroundColor(Color(appTheme + "/ContainerText"))
                    })
                    .alert(isPresented: $showPrivateProfilePopover) {
                        Alert(
                            title: Text(NSLocalizedString("This profile is private.", comment: "")),
                            message: Text(NSLocalizedString("You can only see the users posts if you have been manually approved by them.", comment: ""))
                        )
                    }
                }
                
                Spacer()
                
                switch isOurs {
                case false:
                    Button(userIsFollowing ? "Follow" : "Following") {
                        userIsFollowing.toggle()
                    }.padding(.vertical, 4)
                        .padding(.horizontal, 8)
                        .background(
                            Rectangle()
                                .foregroundColor(Color(appTheme + "/ContainerButtonBody"))
                                .cornerRadius(10))
                case true:
                    Button(action: {
                        showSettingsPopover = true  // This lets us open SettingsView as a "overlay" view
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
                } placeholder: {
                    ProgressView()
                        .frame(width: avatarSize, height: avatarSize)
                        .progressViewStyle(CircularProgressViewStyle(tint: Color(appTheme + "/ContainerText")))
                        .background(Capsule().foregroundColor(Color(appTheme + "/AppBackground").opacity(0.3)))
                }.clipShape(Capsule())
                    .padding(0)

                Spacer()

                VStack {
                    Text(butler.formatMetricUInt(number: postCount))
                        .font(.system(size: textSize + 10, weight: .semibold))
                    Text(NSLocalizedString("Posts", comment: "")).font(.system(size: textSize))
                }

                Spacer()

                VStack {
                    Text(butler.formatMetricUInt(number: followingCount))
                        .font(.system(size: textSize + 10, weight: .semibold))
                    Text(NSLocalizedString("Following", comment: "")).font(.system(size: textSize))
                }

                Spacer()

                VStack {
                    Text(String(butler.formatMetricUInt(number: followerCount)))
                        .font(.system(size: textSize + 10, weight: .semibold))
                    Text(NSLocalizedString("Followers", comment: "")).font(.system(size: textSize))
                }

                Spacer()

            }.padding(.horizontal, 15).padding(.top, -5)

            // Profile bio. We hardcode isVerified to false because of this
            Comment(publisherName: ownerName, content: profileBio)

            // Post History
            let columns = [
                GridItem(.adaptive(minimum: 100), spacing: 0),
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
        .foregroundColor(Color(appTheme + "/ContainerText"))
        .padding(.bottom, 25)
        .frame(width: 370, alignment: .top)
        .background(alignment: .top) {
            Rectangle() // as long as paddings (.trailing/.vertical) are set correctly, the background will auto scale
                .foregroundColor(Color(appTheme + "/ContainerBackground"))
                .cornerRadius(15)
        }
        .popover(isPresented: $showSettingsPopover, content: { SettingsView() })
    }
}

struct OthersProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(isOurs: false, ownerName: "Si Luan Pham", isVerified: true, ownerAvatarUrl: "https://i.ibb.co/tDGTXmK/profile-picture.jpg", postCount: 5, followerCount: 153_600, followingCount: 342, profileBio: "Hi I'm Si Luan Pham, and this is my mockup profile description!", userIsFollowing: true, privateProfile: true)
    }
}
