//
//  SinglePostView.swift
//  Swiftgram
//
//  Created by Eliah Lohr on 17.10.22.
//

import SwiftUI

struct SinglePostView: View {
    var contentID:String = "none"
    
    init(contentID:String) {
        self.contentID = contentID
    }
    
    var body: some View {
        ZStack {
            Color.init("AppBackground").ignoresSafeArea()
            ImagePost(contentId: contentID)
        }
    }
}

struct SinglePostView_Previews: PreviewProvider {
    static var previews: some View {
        SinglePostView(contentID: "none")
    }
}
