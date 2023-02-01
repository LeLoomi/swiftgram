//
//  ProfileImageTile.swift
//  Swiftgram
//
//  Created by Eliah Lohr on 02.10.22.
//

import SwiftUI

struct ImageTile: View {
    var contentUrl: String = "none"
    var size: CGFloat = 100

    @State private var isShowingEnlarged = false
    @AppStorage("AppTheme") private var appTheme = "BaseTheme"

    // used for now to show a mockup image, will be changed to use a post ID and server api
    init(contentUrl: String) {
        self.contentUrl = contentUrl
    }
    
    init(contentUrl: String, size: CGFloat) {
        self.contentUrl = contentUrl
        self.size = size
    }

    var body: some View {
        AsyncImage(url: URL(string: contentUrl)) { image in
            image.resizable()
                .frame(width: size, height: size, alignment: .top)
                .cornerRadius(15)
                .padding(0)
        } placeholder: {
            // Progress view to indicate when downloading
            ProgressView().frame(width: size, height: size, alignment: .center)
                .cornerRadius(15)
                .progressViewStyle(CircularProgressViewStyle(tint: Color(appTheme + "/ContainerText")))
                .background(Rectangle().foregroundColor(Color(appTheme + "/AppBackground")
                        .opacity(0.3)).cornerRadius(15))
                .padding(0)
        }
    }
}

struct ImageTile_Previews: PreviewProvider {
    static var previews: some View {
        // ProfileImageTile(contentUrl: "https://i.ibb.co/YN3vmNr/toronto.jpg")

        ProfileView(isOurs: true, ownerName: "Si Luan Pham", isVerified: true, ownerAvatarUrl: "https://i.ibb.co/tDGTXmK/profile-picture.jpg", postCount: 8, followerCount: 76, followingCount: 92, profileBio: "Hi I'm Si Luan Pham, and this is my mockup profile description!", userIsFollowing: true, privateProfile: true)
    }
}
