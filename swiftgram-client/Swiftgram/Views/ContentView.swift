//
//  ContentView.swift
//  Swiftgram
//  This view is the top of the application. It "holds" all content.
//
//  Created by Eliah Lohr on 25.09.22.
//

import SwiftUI

struct ContentView: View {
    @State var navIndex = 0
    @AppStorage("AppTheme") private var appTheme = "BaseTheme"
    let tabIcons = ["person.crop.rectangle.stack", "magnifyingglass", "plus.circle", "heart", "person"]

    var body: some View {
        // The VStack contains our content and puts the bar at the bottom (change later to allow bar as overlay in feed?)
        VStack {
            switch navIndex {
            case 0:
                FeedView().clipped()
            case 1:
                DiscoverView()
            case 2:
                NavigationView {
                    Text("upload page")
                }
            case 3:
                InteractionsView()
            case 4:
                ProfileView(isOurs: true, ownerName: "Si Luan Pham", isVerified: true, ownerAvatarUrl: "https://i.ibb.co/tDGTXmK/profile-picture.jpg", postCount: 8, followerCount: 76, followingCount: 92, profileBio: "Hi I'm Si Luan Pham, and this is my mockup profile description!", userIsFollowing: false, privateProfile: true)
            default:
                NavigationView {
                    Text("ERROR: unexpected navbar index!")
                }
            }

            // This HStack is our actual Navbar
            HStack {
                ForEach(0 ..< 5) { index in
                    Button(action: {
                        navIndex = index
                    }, label: {
                        Spacer()

                        if index == 2 {
                            Image(systemName: tabIcons[index])
                                .font(.system(size: 40, weight: .bold))
                                .foregroundColor(Color(appTheme + "/SpecialButtonBody"))
                        } else {
                            Image(systemName: tabIcons[index])
                                .font(.system(size: 28))
                                .foregroundColor(navIndex == index ?
                                                 Color(appTheme + "/ContainerText") : Color.gray)
                        }
                        Spacer()
                    })
                }

            }.padding(.horizontal, 15)
                .padding(.bottom, -8)
                .padding(.top, 5)

        }.background(Color(appTheme + "/AppBackground"))
    }

    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
