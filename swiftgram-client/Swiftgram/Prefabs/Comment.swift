//
//  Comment.swift
//  Swiftgram
//
//  Created by Eliah Lohr on 28.09.22.
//

import SwiftUI

struct Comment: View {
    var publisherName: String = "none"
    var content: String = "none"

    let textSize: CGFloat = 15

    @AppStorage("AppTheme") private var appTheme = "BaseTheme"

    init(publisherName: String, content: String) {
        self.publisherName = publisherName
        self.content = content
    }

    var body: some View {
        HStack {
            // change name to be a button taking you to their profile
            Text(publisherName + " ").bold() +
                Text(content)
            Spacer()
        }
        .font(.system(size: textSize))
        .foregroundColor(Color(appTheme + "/ContainerText"))
        .padding(.horizontal, 20)
    }
}

struct Comment_Previews: PreviewProvider {
    static var previews: some View {
        Comment(publisherName: "Loomi", content: "Woow! This is test Text!")
    }
}
