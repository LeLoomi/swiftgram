//
//  SecuritySettingsSubview.swift
//  Swiftgram
//
//  Created by Eliah Lohr on 20.12.22.
//

import SwiftUI

struct SecuritySettings: View {
    @State var showResetPasswordDialog: Bool = false
    @State var showEmailResetDialog: Bool = false
    
    @State var userEmail: String = "max@example.org"
    @State var emailOutOfTouch: Bool = false
    var originalUserEmail: String?
    
    init() {
        self.originalUserEmail = self.userEmail
    }
    
    var body: some View {
        Form {
            // Email reset and general header
            Section {
                HStack {
                    Image(systemName: "envelope").padding(.trailing, 1)
                    TextField("my@email.de", text: $userEmail)
                        .italic()
                        .onSubmit {
                            emailOutOfTouch = (userEmail == originalUserEmail) ? false : true
                        }
                    Spacer()
                    
                    if emailOutOfTouch {
                        Button {
                            showEmailResetDialog = true
                        } label: {
                            Label("", systemImage: emailOutOfTouch ? "arrow.triangle.2.circlepath" : "")
                                .labelStyle(.iconOnly)
                                .foregroundColor(.indigo)
                        }.alert(isPresented: $showEmailResetDialog) {
                            Alert(
                                title: Text(NSLocalizedString("Update email", comment: "Reset  password dialog header")),
                                message: Text(NSLocalizedString("You'll recieve a link on your new email. \nTo confirm your new email, you will have to enter your password.", comment: "Email reset dialog body.")),
                                primaryButton: .default(
                                    Text(NSLocalizedString("Cancel", comment: "Button in popup promt.")),
                                    action: {}
                                ),
                                secondaryButton: .destructive(
                                    Text(NSLocalizedString("Proceed", comment: "Button in popup promt.")),
                                    action: {
                                        // ADD EMAIL RESET CODE HERE
                                    }
                                )
                            )
                        }
                    }
                }
            } header: {
                Text(NSLocalizedString("Email and password", comment: "Header in settings"))
            } footer: {
                    Text(emailOutOfTouch ?
                         NSLocalizedString("To save your email adress, tap the refresh icon.", comment: "Tooltip in settings.") :
                            NSLocalizedString("Start typing to change your email adress.", comment: "Tooltip in settings.")
                    )
            }
            
            // Password reset
            Section {
                Button {
                    showResetPasswordDialog = true
                } label: {
                    Label(NSLocalizedString("Reset password", comment: "Button in settings."), systemImage: "key")
                        .foregroundColor(.red)
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
                                    action: {
                                        // ADD PASSWORD RESET CODE HERE
                                    }
                                )
                            )
                }
            }

        }
    }
}

struct SecuritySettingsSubview_Previews: PreviewProvider {
    static var previews: some View {
        SecuritySettings()
    }
}
