//
//  SecuritySettingsSubview.swift
//  Swiftgram
//
//  Created by Eliah Lohr on 20.12.22.
//

import SwiftUI

struct SecuritySettings: View {
    @State var showResetPasswordDialog: Bool = false
    
    @State var userEmail: String = "max@example.org"
    
    var body: some View {
        Form {
            Section {
                HStack {
                    Image(systemName: "envelope").padding(.trailing, 1)
                    TextField("my@email.de", text: $userEmail)
                    Spacer()
                    Text(NSLocalizedString("tap to change", comment: "Tooltip in settings."))
                        .font(.footnote)
                        .foregroundColor(.gray)
                }
                
                Button {
                    showResetPasswordDialog = true
                } label: {
                    HStack {
                        Image(systemName: "key").padding(.horizontal, 4)
                        Text("Reset password")
                    }.foregroundColor(.red)
                }.alert(isPresented: $showResetPasswordDialog) {
                    Alert(
                                title: Text(NSLocalizedString("Reset password", comment: "Reset  password dialog header")),
                                message: Text(NSLocalizedString("You'll recieve a reset link by email. \nAfter the reset you will need to re-login on all devices.", comment: "Pswd reset dialog body.")),
                                primaryButton: .default(
                                    Text(NSLocalizedString("Cancel", comment: "Button in popup promt.")),
                                    action: {}
                                ),
                                secondaryButton: .destructive(
                                    Text(NSLocalizedString("Reset", comment: "Button in popup promt.")),
                                    action: {}
                                )
                            )
                }
            } header: {
                Text(NSLocalizedString("Email and password", comment: "Header in settings"))
            }

        }
    }
}

struct SecuritySettingsSubview_Previews: PreviewProvider {
    static var previews: some View {
        SecuritySettings()
    }
}
