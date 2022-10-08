//
//  LocationBox.swift
//  Swiftgram
//
//  Created by Eliah Lohr on 28.09.22.
//

import SwiftUI

struct LocationBox: View {
    var postLocation: String = "none"

    init(postLocation: String) {
        self.postLocation = postLocation
    }

    var body: some View {
        if postLocation != "none" {
            HStack(spacing: 5) {
                Text(postLocation).font(.system(size: 12, weight: .semibold))
                Image(systemName: "mappin.circle").font(.system(size: 12, weight: .bold))
            }.padding(5)
                .background(Rectangle()
                    .foregroundColor(.black.opacity(0.5))
                    .cornerRadius(5)
                )
                .foregroundColor(.white)
                .padding(5)
        }
    }
}

struct LocationBox_Previews: PreviewProvider {
    static var previews: some View {
        LocationBox(postLocation: "Ninh Binh, Vietnam")
    }
}
