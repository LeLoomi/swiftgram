//
//  SettingsView.swift
//  Swiftgram
//
//  Created by Eliah Lohr on 17.11.22.
//

import SwiftUI

struct SettingsView: View {
    @State var showPrivateProfileTooltip = false
    
    @State var privateProfile = false
    @State var cacheMemoryAmount: String = "16"

    var body: some View {
        NavigationView {
            Form {
                // Profile settings start here. All the stuff other users see.
                Section(NSLocalizedString("Profile", comment: "Section in settings")) {
                    NavigationLink {
                        AvatarSettings()
                    } label: {
                        Label(NSLocalizedString("Modify avatar", comment: "Option in settings"), systemImage: "camera.aperture")
                    }
                    
                    NavigationLink {
                        BioSettings()
                    } label: {
                        Label(NSLocalizedString("Modify description", comment: "Option in settings"), systemImage: "fleuron")
                    }
                    
                    Toggle(isOn: $privateProfile) {
                        HStack {
                            Label(NSLocalizedString("Private profile", comment: "Option in settings"), systemImage: "lock.shield")
                            Button {
                                showPrivateProfileTooltip = true
                            } label: {
                                Image(systemName: "info.circle").font(.footnote)
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
                        NotificationsSettings()
                    } label: {
                        Label(NSLocalizedString("Notifcations", comment: "Option in settings"), systemImage: "bell.badge")
                    }
                    
                    NavigationLink {
                        AppearanceSettings()
                    } label: {
                        Label(NSLocalizedString("Appearance", comment: "Option in settings"), systemImage: "theatermask.and.paintbrush")
                    }
                    
                    Button {
                        // ADD CACHE RESET FUNCTIONALITY HERE
                    } label: {
                        HStack {
                            Label(NSLocalizedString("Clear cache", comment: "Option in settings"), systemImage: "sdcard")
                            Spacer()
                            Text("\(NSLocalizedString("this will free", comment: "E.g. this will free xy MB from the cache.")) \(cacheMemoryAmount)MB").font(.footnote).padding(.top, 3)
                        }.foregroundColor(.gray)
                    }
                    
                }
                
                // Account settings start here
                Section(NSLocalizedString("Account", comment: "Section in settings")) {
                    NavigationLink {
                        SecuritySettings()
                    } label: {
                        Label(NSLocalizedString("Login and security", comment: "Option in settings"), systemImage: "key")
                    }
                    
                    Button {
                        // ADD ACCOUNT RESET FUNCTIONALITY HERE, ALERT FIRST!?
                    } label: {
                        Label(NSLocalizedString("Delete account", comment: "Option in settings"), systemImage: "minus.diamond").foregroundColor(.red)
                    }
                }
                
                // Only app info goes here
                Section {
                    Link(NSLocalizedString("Developed by Eliah Lohr - this project is purely educational.", comment: ""), destination: URL(string: "https://github.com/LeLoomi")!)
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
