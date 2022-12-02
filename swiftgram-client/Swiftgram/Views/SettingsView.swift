//
//  SettingsView.swift
//  Swiftgram
//
//  Created by Eliah Lohr on 17.11.22.
//

import SwiftUI

struct SettingsView: View {
    @State var privateProfile = false
    @State var showPrivateProfileTooltip = false

    var body: some View {
        NavigationView {
            Form {
                // Profile settings start here. All the stuff other users see.
                Section(NSLocalizedString("Profile", comment: "Section in settings")) {
                    NavigationLink {
                        Text("Not yet implemented.")
                    } label: {
                        Image(systemName: "person.crop.circle").padding(.trailing, 2)
                        Text(NSLocalizedString("Modify avatar", comment: "Option in settings"))
                    }

                    NavigationLink {
                        Text("Not yet implemented.")
                    } label: {
                        Image(systemName: "text.book.closed").padding(.trailing, 2)
                        Text(NSLocalizedString("Modify description", comment: "Option in settings"))
                    }

                    Toggle(isOn: $privateProfile) {
                        HStack {
                            Text(Image(systemName: "lock.shield")).padding(.trailing, 4)
                            Text(NSLocalizedString("Private profile", comment: "Option in settings"))
                            Button {
                                showPrivateProfileTooltip = true
                            } label: {
                                Image(systemName: "info.circle")
                            }
                        }
                        .alert(isPresented: $showPrivateProfileTooltip) {
                            Alert(
                                title: Text(NSLocalizedString("Private profiles", comment: "Private profile explainer header")),
                                message: Text(NSLocalizedString("You need to approve new followers before they gain access to your profile. \nPeople not following you will still see your name, avatar and bio.", comment: "Private profile explainer body"))
                            )
                        }

                    }.foregroundColor(.indigo)
                }

                // App specific settings start here
                Section(NSLocalizedString("Application", comment: "Section in settings")) {
                    NavigationLink {
                        Text("Not yet implemented.")
                    } label: {
                        Image(systemName: "bell.badge").padding(.trailing, 2)
                        Text(NSLocalizedString("Notifcations", comment: "Option in settings"))
                    }

                    NavigationLink {
                        AppearanceSettings()
                    } label: {
                        Image(systemName: "theatermask.and.paintbrush")
                        Text(NSLocalizedString("Appearance", comment: "Option in settings")).padding(.horizontal, -1)
                    }

                    NavigationLink {
                        Text("Not yet implemented.")
                    } label: {
                        Image(systemName: "sdcard").padding(.horizontal, 3)
                        Text(NSLocalizedString("Clear cache", comment: "Option in settings"))
                    }.foregroundColor(.gray)
                }

                // Account settings start here
                Section(NSLocalizedString("Account", comment: "Section in settings")) {
                    NavigationLink {
                        Text("Not yet implemented.")
                    } label: {
                        Image(systemName: "key").padding(.horizontal, 4)
                        Text(NSLocalizedString("Login and security", comment: "Option in settings"))
                    }

                    NavigationLink {
                        Text("Not yet implemented.")
                    } label: {
                        Image(systemName: "minus.diamond").padding(.trailing, 2)
                        Text(NSLocalizedString("Delete account", comment: "Option in settings"))
                    }.foregroundColor(Color("BaseTheme/WarningContainerText"))
                }

                // Only app info goes here, maybe cache clear?
                Section(NSLocalizedString("", comment: "Section in settings")) {
                    Text(NSLocalizedString("Developed by Eliah Lohr - this project is purely educational.", comment: ""))
                        .font(.system(size: 14))
                        .foregroundColor(.gray)
                        .padding(2)
                }
            }
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
