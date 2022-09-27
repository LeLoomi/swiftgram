//
//  FeedView.swift
//  Swiftgram
//
//  Created by Eliah Lohr on 25.09.22.
//

import SwiftUI

struct FeedView: View {
        
    var examplePost1 = ImagePost(content_id: "abc001", publisher_id: "dev-loomi")
    
    var body: some View {
        ScrollView {
            VStack(spacing: 0)
            {
                examplePost1.contentView
                examplePost1.contentView
                examplePost1.contentView
            }
        }.cornerRadius(15)
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
