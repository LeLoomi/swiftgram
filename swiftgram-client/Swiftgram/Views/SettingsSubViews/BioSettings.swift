//
//  BioSettings.swift
//  Swiftgram
//
//  Created by Eliah Lohr on 22.12.22.
//

import SwiftUI

struct BioSettings: View {
    
    let butler = Butler()
    
    @AppStorage("bioText") private var bioText: String = ""
    
    var body: some View {
        Form {
            Section {
                TextField(NSLocalizedString("Your bio goes here", comment: "Tooltip in settings."), text: $bioText)
                    .onSubmit {
                        butler.saveSetting(key: "bioText", value: bioText)
                    }
            } footer: {
                Text(NSLocalizedString("Just hit submit on your keyboard to save.", comment: "Tooltip in bio settings"))
            }
        }
    }
}

struct BioSettings_Previews: PreviewProvider {
    static var previews: some View {
        BioSettings()
    }
}
