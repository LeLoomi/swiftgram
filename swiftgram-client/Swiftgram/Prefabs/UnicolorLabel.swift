//
//  UnicolorLabel.swift
//  Swiftgram
//
//  Created by Eliah Lohr on 22.12.22.
//

import SwiftUI

struct UnicolorLabel: View {
    
    let label: String
    let systemName: String
    
    init(label: String, systemName: String) {
        self.label = label
        self.systemName = systemName
    }
    
    var body: some View {
        Label {
                    Text("Favorites")
                } icon: {
                    Image(systemName: "heart")
                }
    }
}

struct UnicolorLabel_Previews: PreviewProvider {
    static var previews: some View {
        UnicolorLabel(label: "Favorites", systemName: "heart")
    }
}
