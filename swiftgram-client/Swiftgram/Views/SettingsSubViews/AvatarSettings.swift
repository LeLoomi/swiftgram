//
//  AvatarSettings.swift
//  Swiftgram
//
//  Created by Eliah Lohr on 23.12.22.
//

import SwiftUI

struct AvatarSettings: View {
    
    let avatarSize: CGFloat = 150
    
    var body: some View {
        Form {
            HStack {
                Spacer()
                AsyncImage(url: URL(string: "https://i.ibb.co/tDGTXmK/profile-picture.jpg")) { image in
                    image.resizable()
                        .frame(width: avatarSize, height: avatarSize)
                        .padding(0)
                } placeholder: {
                    ProgressView()
                        .frame(width: avatarSize, height: avatarSize)
                        .progressViewStyle(CircularProgressViewStyle())
                        .background(Capsule().opacity(0.3))
                        .padding(0)
                }.clipShape(Capsule())
                Spacer()
            }
            
            Button {
                // Add photos integrations here
            } label: {
                HStack {
                    Image(systemName: "photo").padding(.trailing, 2)
                    Text(NSLocalizedString("From gallery", comment: "Option in avatar settings"))
                }
            }
            
            Button {
                // Add camera import functionality here
            } label: {
                HStack {
                    Image(systemName: "camera").padding(.trailing, 2)
                    Text(NSLocalizedString("From camera", comment: "Option in avatar settings"))
                }
            }

            Button {
                // Add remove avatar functionality here
            } label: {
                HStack {
                    Image(systemName: "person.crop.circle.badge.minus").padding(.horizontal, 3)
                    Text(NSLocalizedString("Remove my avatar", comment: "Option in avatar settings"))
                }
            }
        }
    }
}

struct AvatarSettings_Previews: PreviewProvider {
    static var previews: some View {
        AvatarSettings()
    }
}
