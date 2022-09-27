//
//  Imagepost.swift
//  Swiftgram
//
//  Created by Eliah Lohr on 25.09.22.
//
//  This class is our prefab for post data. It will be used to create the corresponding post object

import Foundation
import SwiftUI

//For now, we'll just hand-set the contents since there's no server to go along yet. (See init)
class ImagePost {
    
    
    var contentId:String = "not set"   //unique ID of the post. Used i.e. to get Image data from the server when displaying the post
    
    //these ones will be set when post data is being downloaded
    var pubName:String = "not set"
    var pubAvatarUrl:String = "not set"
    var postImageUrl:String = "not set"
    var likeCount:UInt32 = 0
    
    //for useless, supposed to fetch stuff from the server later
    init(contentId:String) {
        self.contentId = contentId
    }
    
    //this constructor to hand test while no server code is written
    init(publisherName:String, publisherAvatarUrl:String, imageUrl:String, likeCount:UInt32) {
        self.pubName = publisherName
        self.pubAvatarUrl = publisherAvatarUrl
        self.postImageUrl = imageUrl
        self.likeCount = 54
        }
    
    @ViewBuilder var contentView: some View {
        VStack(spacing: 0) {
            //Post header, aka Profile pic and name
            HStack {
                AsyncImage(url: URL(string: pubAvatarUrl)) { image in
                    image.resizable()
                        .frame(width: 50, height: 50)
                        .clipShape(Capsule())
                        .padding(0)
                } placeholder: {
                    ProgressView().frame(width: 50, height: 50)
                        .clipShape(Capsule())
                        .padding(0)
                }
                
                //publisherImage.resizable()
                //    .frame(width: 50, height: 50)
                //    .clipShape(Capsule())
                //    .padding(0)
                
                Text(pubName)
                    .font(.system(size: 20, weight: .semibold))
                    .foregroundColor(.white)
                
                Spacer()
                
            }
            .padding(10)
            .padding([.bottom], 0)
            
            AsyncImage(url: URL(string: postImageUrl)) { image in
                image.resizable()
                    .frame(width: 350, height: 350, alignment: .top)
                    .cornerRadius(15)
                    .padding(0)
            } placeholder: {
                ProgressView().frame(width: 350, height: 350, alignment: .center)
                    .cornerRadius(15)
                    .padding(0)
            }
            
        }
            .padding(0)
            .frame(width: 370, height: 450, alignment: .top)
            .background(alignment: .top) {
                Rectangle()
                    .frame(width: 370, height: 430)
                    .foregroundColor(Color("ContainerBackground"))
                    .cornerRadius(15)
            }
    }
}



struct ImagePost_Previews: PreviewProvider {
    static var previews: some View {
        ImagePost(publisherName: "Si Luan Pham", publisherAvatarUrl: "https://i.ibb.co/tDGTXmK/profile-picture.jpg", imageUrl: "https://i.ibb.co/thp8tmS/temple.jpg", likeCount: 56).contentView
    }
}
