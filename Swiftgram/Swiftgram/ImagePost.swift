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
    
    
    var contentId:String    //unique ID of the post. Used i.e. to get Image data from the server when displaying the post
    var publisherId:String  //unique ID of the poster's account - internal username if you will
    
    //these ones will be set when post data is being downloaded
    var publisherName:String = "Si Luan Pham"
    var publisherImage:Image = Image("mockup-pb")
    var postImage:Image = Image("mockup-post")
    
    //for now we hand set those
    init(content_id:String, publisher_id:String) {
        contentId = content_id
        publisherId = publisher_id
    }
    
    @ViewBuilder var contentView: some View {
        VStack(spacing: 0) {
                //Post header, aka Profile pic and name
                HStack {
                    publisherImage.resizable().frame(width: 50, height: 50).clipShape(Capsule()).padding(0)
                    Text(publisherName).font(.system(size: 20, weight: .semibold)).foregroundColor(.white)
                    Spacer()
                    
                }.padding(10).padding([.bottom], 0)
                
            postImage.resizable().frame(width: 350, height: 350, alignment: .top).cornerRadius(15).padding(0)
            }
            .padding(0).frame(width: 370, height: 450, alignment: .top)
            .background(alignment: .top) {
                Rectangle().frame(width: 370, height: 430).foregroundColor(Color("ContainerBackground")).cornerRadius(15)
            }
        
    }
}


struct ImagePost_Previews: PreviewProvider {
    static var previews: some View {
        ImagePost(content_id: "abc001", publisher_id: "dev-loomi").contentView
    }
}
