//
//  FeedView.swift
//  Swiftgram
//
//  Created by Eliah Lohr on 25.09.22.
//

import SwiftUI

struct FeedView: View {
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            LazyVStack(spacing: 10) {
                //This VStack later will hold all our posts that we instantiate

                ImagePost(publisherName: "Tommy Lewis", isVerified: false,
                          publisherAvatarUrl: "https://i.ibb.co/xMbLRqb/profile-picture.jpg",
                          imageUrl: "https://i.ibb.co/YN3vmNr/toronto.jpg",
                          likeCount: 73,
                          postLocation: "Toronto, Canada", postTimestamp: Date.init())

                ImagePost(publisherName: "Si Luan Pham", isVerified: true,
                          publisherAvatarUrl: "https://i.ibb.co/tDGTXmK/profile-picture.jpg",
                          imageUrl: "https://i.ibb.co/thp8tmS/temple.jpg",
                          likeCount: 56,
                          postLocation: "Ninh Binh, Vietnam", postTimestamp: Date.init())
                
                ImagePost(publisherName: "Lilly Ann", isVerified: false,
                          publisherAvatarUrl: "https://i.ibb.co/jhdTcgy/profile-picture.jpg",
                          imageUrl: "https://i.ibb.co/h2LNhB6/14.jpg",
                          likeCount: 61,
                          postLocation: "New York City, USA", postTimestamp: Date.init())
            }
        }.cornerRadius(15)
            .shadow(color: Color("AppBackground").opacity(0.75), radius: 5)
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
