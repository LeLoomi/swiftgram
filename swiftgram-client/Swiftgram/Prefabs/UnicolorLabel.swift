//
//  UnicolorLabel.swift
//  Swiftgram
//
//  Created by Eliah Lohr on 22.12.22.
//

import SwiftUI

struct UnicolorLabel: View {
    @AppStorage("AppTheme") private var appTheme: String = "BaseTheme"
    
    let label: String
    let systemName: String
    
    init(label: String, systemName: String) {
        self.label = label
        self.systemName = systemName
    }
    
    var body: some View {
        Label {
                    Text(label)
                } icon: {
                    Image(systemName: systemName)
                }
    }
}

struct UnicolorLabel_Previews: PreviewProvider {
    static var previews: some View {
        UnicolorLabel(label: "Kiwis", systemName: "heart")
    }
}
