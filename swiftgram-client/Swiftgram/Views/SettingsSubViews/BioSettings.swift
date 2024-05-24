//
//  BioSettings.swift
//  Swiftgram
//
//  Created by Eliah Lohr on 22.12.22.
//

import SwiftUI

struct BioSettings: View {
    @AppStorage("bioText") private var bioText: String = ""
    
    var body: some View {
        Form {
            Section {
                TextField(NSLocalizedString("Your bio goes here", comment: "Tooltip in settings."), text: $bioText)
                    .onSubmit {
                        bioText.saveInUserDefaults(key: "bioText")
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
