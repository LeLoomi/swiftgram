//
//  ProfileImageTile.swift
//  Swiftgram
//
//  Created by Eliah Lohr on 02.10.22.
//

import SwiftUI

struct ProfileImageTile: View {
    
    var contentUrl:String = "none"
    var size:CGFloat = 100
    @State var showExtended:Bool = false
    
    init(contentUrl: String) {
        self.contentUrl = contentUrl
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
                .progressViewStyle(CircularProgressViewStyle(tint: Color("ContainerText")))
                .background(Rectangle().foregroundColor(Color("AppBackground")
                        .opacity(0.3)).cornerRadius(15))
                .padding(0)
        }.overlay(Button(action: {
            showExtended.toggle()
        }, label: {
            Rectangle()
                .opacity(0.3)
                .cornerRadius(15)
        }))
    }
}

struct ProfileImageTile_Previews: PreviewProvider {
    static var previews: some View {
        ProfileImageTile(contentUrl: "none")
    }
}
