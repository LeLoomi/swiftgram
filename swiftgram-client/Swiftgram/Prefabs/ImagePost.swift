//
//  ImagePost.swift
//  Swiftgram
//
//  Created by Eliah Lohr on 25.09.22.
//
//  This class is our prefab for post data. It will be used to create the corresponding post object
//  How we load images from the server will be changed in the future! -> DB etc.

import SwiftUI

struct ImagePost: View {
    // until we have server backend to go along, use init with all arguments!
    private var contentId: String = "not set" // unique ID of the post. Used i.e. to get Image data from the server when displaying the post

    // these variables will be set when post data is being downloaded. Implement new ones WITH datatype to avoid having to unwrap!
    private var publisherName: String = "not set"
    private var publisherAvatarUrl: String = "not set"
    private var postImageUrl: String = "not set"
    private var likeCount: UInt32 = 0
    private var postLocation: String = "none"

    // for useless, supposed to fetch stuff from the server later
    init(contentId: String) {
        self.contentId = contentId
        // fetch the content values here
    }

    // this constructor to hand test data while no server code is written. Set location to 'none' if no location tag wanted
    init(publisherName: String, publisherAvatarUrl: String, imageUrl: String, likeCount: UInt32, postLocation: String) {
        self.publisherName = publisherName
        self.publisherAvatarUrl = publisherAvatarUrl
        self.postImageUrl = imageUrl
        self.likeCount = likeCount
        self.postLocation = postLocation
    }

    var body: some View {
        VStack(spacing: 0) {
            // Post header, aka Profile pic and name
            HStack {
                // our publisher image
                AsyncImage(url: URL(string: publisherAvatarUrl)) { image in
                    image.resizable()
                        .frame(width: 50, height: 50)
                        .clipShape(Capsule())
                        .padding(0)
                } placeholder: {
                    ProgressView().frame(width: 50, height: 50)
                        .clipShape(Capsule())
                        .progressViewStyle(CircularProgressViewStyle(tint: Color("ContainerText")))
                        .background(Capsule().foregroundColor(Color("AppBackground").opacity(0.3)))
                        .padding(0)
                }

                // the publishers name next to the avatar
                Text(publisherName)
                    .font(.system(size: 20, weight: .semibold))

                // move it all to the left in the HStack
                Spacer()
            }
            .padding(10)
            .padding(.bottom, 0)

            // the posts actual image
            AsyncImage(url: URL(string: postImageUrl)) { image in
                image.resizable()
                    .frame(width: 350, height: 350, alignment: .top)
                    .cornerRadius(15)
                    .padding(0)
            } placeholder: {
                // Progress view to indicate when downloading
                ProgressView().frame(width: 350, height: 350, alignment: .center)
                    .cornerRadius(15)
                    .progressViewStyle(CircularProgressViewStyle(tint: Color("ContainerText")))
                    .background(Rectangle().foregroundColor(Color("AppBackground")
                            .opacity(0.3)).cornerRadius(15))
                    .padding(0)
            }
            .overlay(LocationBox(postLocation: postLocation), alignment: .bottomTrailing) // Location box as overlay over the image

            // Our post stats stuff, likes comment button..
            HStack {
                Button(action: {
                    // add like code here
                }, label: {
                    // Later we need to switch the like icon around if userLiked == true
                    Image(systemName: "heart")
                        .font(.system(size: 20, weight: .semibold))
                })

                Button(action: {
                    // add like code here
                }, label: {
                    Image(systemName: "bubble.left")
                        .font(.system(size: 18, weight: .semibold))
                })

                Text(String(likeCount) + " Likes")
                    .font(.system(size: 15, weight: .semibold))

                Spacer()
            }.padding(.vertical, 10).padding(.horizontal, 15)

            // current placeholder comment, might be moved somewhat in the future? This will depend how comment section will be handled
            Comment(publisherName: publisherName, content: "Ninh Binh is so great! If you ever need to just relax a bit, then this is your best destination!")
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

struct ImagePost_Previews: PreviewProvider {
    static var previews: some View {
        ImagePost(publisherName: "Si Luan Pham", publisherAvatarUrl: "https://i.ibb.co/tDGTXmK/profile-picture.jpg", imageUrl: "https://i.ibb.co/thp8tmS/temple.jpg", likeCount: 56, postLocation: "Ninh Binh, Vietnam")
    }
}
