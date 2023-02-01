//
//  SearchResult.swift
//  Swiftgram
//
//  Created by Eliah Lohr on 08.01.23.
//

import SwiftUI

struct SearchResult: View {
    
    private var userId: String = "not set"
    private var ownerName: String = "not set"
    private var isVerified: Bool = false
    private var ownerAvatarUrl: String = "not set"
    
    @AppStorage("AppTheme") private var appTheme = "BaseTheme"

    // local style variables
    let textSize: CGFloat = 10
    let avatarSize: CGFloat = 40
    
    init(userId: String) {
        self.userId = userId
    }
    
    init(ownerName: String, isVerified: Bool, ownerAvatarUrl: String) {
        self.ownerName = ownerName
        self.isVerified = isVerified
        self.ownerAvatarUrl = ownerAvatarUrl
    }
    
    var body: some View {
        HStack {
            // our publisher image
            AsyncImage(url: URL(string: ownerAvatarUrl)) { image in
                image.resizable()
                    .frame(width: avatarSize, height: avatarSize)
            } placeholder: {
                ProgressView().frame(width: avatarSize, height: avatarSize)
                    .progressViewStyle(CircularProgressViewStyle(tint: Color(appTheme + "/ContainerText")))
                    .background(Capsule().foregroundColor(Color(appTheme + "/AppBackground").opacity(0.3)))
            }.clipShape(Capsule())
                .padding(0)

            // the publishers name next to the avatar
            Text(ownerName)
                .font(.system(size: 15))

            // the verification badge, only active if verified
            VerifiedCheckmark(isVerified: isVerified, size: 15)
                .padding(.leading, -3)

            // move it all to the left in the HStack
            Spacer()
        }
        .padding(15)
        .padding(.bottom, 0)
    }
}

struct SearchResult_Previews: PreviewProvider {
    static var previews: some View {
        SearchResult(ownerName: "LeLoomi", isVerified: true, ownerAvatarUrl: "https://cutt.ly/l2We909")
    }
}
