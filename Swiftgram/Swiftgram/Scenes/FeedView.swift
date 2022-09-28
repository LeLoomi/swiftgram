//
//  FeedView.swift
//  Swiftgram
//
//  Created by Eliah Lohr on 25.09.22.
//

import SwiftUI

struct FeedView: View {
        
    
    
    var body: some View {
        ScrollView (.vertical, showsIndicators: false) {
            VStack(spacing: 10)
            {
                 ImagePost(publisherName: "Si Luan Pham",
                          publisherAvatarUrl: "https://i.ibb.co/tDGTXmK/profile-picture.jpg",
                          imageUrl: "https://i.ibb.co/thp8tmS/temple.jpg",
                          likeCount: 56,
                          postLocation: "Ninh Binh, Vietnam"
                ).contentView
                
                ImagePost(publisherName: "Tommy Lewis",
                         publisherAvatarUrl: "https://i.ibb.co/xMbLRqb/profile-picture.jpg",
                         imageUrl: "https://i.ibb.co/YN3vmNr/toronto.jpg",
                         likeCount: 73,
                         postLocation: "Toronto, Canada"
               ).contentView
                
                ImagePost(publisherName: "Lilly Ann",
                         publisherAvatarUrl: "https://i.ibb.co/jhdTcgy/profile-picture.jpg",
                         imageUrl: "https://i.ibb.co/h2LNhB6/14.jpg",
                         likeCount: 61,
                         postLocation: "New York City, USA"
               ).contentView
            
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
