//
//  Imagepost.swift
//  Swiftgram
//
//  Created by Eliah Lohr on 25.09.22.
//
//  This class is our prefab for post data. It will be used to create the corresponding post object

import SwiftUI

//For now, we'll just hand-set the contents since there's no server to go along yet. (See init)
struct ImagePost: View{
    
    
    var contentId:String = "not set"   //unique ID of the post. Used i.e. to get Image data from the server when displaying the post
    
    //these ones will be set when post data is being downloaded
    var pubName:String = "not set"
    var pubAvatarUrl:String = "not set"
    var postImageUrl:String = "not set"
    var likeCount:UInt32 = 0
    var postLocation:String = "none"
    
    //for useless, supposed to fetch stuff from the server later
    init(contentId:String) {
        self.contentId = contentId
    }
    
    //this constructor to hand test while no server code is written. Set location to 'none' if no location tag wanted
    init(publisherName:String, publisherAvatarUrl:String, imageUrl:String, likeCount:UInt32, postLocation:String) {
        self.pubName = publisherName
        self.pubAvatarUrl = publisherAvatarUrl
        self.postImageUrl = imageUrl
        self.likeCount = likeCount
        self.postLocation = postLocation
        }
    
    var body: some View {
        VStack(spacing: 0) {
            //Post header, aka Profile pic and name
            HStack {
                //our publisher image
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
                
                //publisher text next to the avatar
                Text(pubName)
                    .font(.system(size: 20, weight: .semibold))
                    .foregroundColor(Color("ContainerText"))
                
                //move it all to the left in the HStack
                Spacer()
                
            }
            .padding(10)
            .padding(.bottom, 0)
            
            //our post image
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
            .overlay(LocationBox(postLocation: postLocation), alignment: .bottomTrailing) //Location box as overlay
            
            //Our post stats stuff, likes comment button..
            HStack {
                Button(action: {
                    return //add like code here
                }, label: {
                    //Later we need to switch the like icon around if userLiked == true
                    Image(systemName: "heart")
                        .foregroundColor(Color("ContainerText"))
                        .font(.system(size: 20, weight: .semibold))
                })
                
                Button(action: {
                    return //add like code here
                }, label: {
                    Image(systemName: "bubble.left")
                        .foregroundColor(Color("ContainerText"))
                        .font(.system(size: 17, weight: .semibold))
                })
                
                Text(String(likeCount) + " Likes")
                    .foregroundColor(Color("ContainerText"))
                    .font(.system(size: 15, weight: .semibold))
                
                Spacer()
            }.padding(.vertical, 10).padding(.horizontal, 15)
            
            Comment(publisherName: pubName, content: "Ninh Binh is so great! If you ever need to just relax a bit, then this is your best destination!")
            
        }
        .padding(.bottom, 25)
        .frame(width: 370, alignment: .top)
        .background(alignment: .top) {
            Rectangle()
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
