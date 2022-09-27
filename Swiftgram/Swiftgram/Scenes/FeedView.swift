//
//  FeedView.swift
//  Swiftgram
//
//  Created by Eliah Lohr on 25.09.22.
//

import SwiftUI

struct FeedView: View {
        
    
    
    var body: some View {
        ScrollView {
            VStack(spacing: 0)
            {
                ImagePost(publisherName: "Si Luan Pham",
                          publisherAvatarUrl: "https://i.ibb.co/tDGTXmK/profile-picture.jpg",
                          imageUrl: "https://i.ibb.co/thp8tmS/temple.jpg",
                          likeCount: 56
                ).contentView
            }
        }.cornerRadius(15)
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
