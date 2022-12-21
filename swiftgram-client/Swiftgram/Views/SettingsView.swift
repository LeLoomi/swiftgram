//
//  SettingsView.swift
//  Swiftgram
//
//  Created by Eliah Lohr on 17.11.22.
//

import SwiftUI

struct SettingsView: View {
    @AppStorage("AppTheme") private var appTheme: String = "BaseTheme"
    
    @State var showPrivateProfileTooltip = false
    
    @State var privateProfile = false
    @State var cacheMemoryAmount: String = "16"

    var body: some View {
        NavigationView {
            Form {
                // Profile settings start here. All the stuff other users see.
                Section(NSLocalizedString("Profile", comment: "Section in settings")) {
                    NavigationLink {
                        Text("Not yet implemented.")
                    } label: {
                        Image(systemName: "camera.aperture").padding(.trailing, 2)
                        Text(NSLocalizedString("Modify avatar", comment: "Option in settings"))
                    }
                    
                    NavigationLink {
                        Text("Not yet implemented.")
                    } label: {
                        Image(systemName: "fleuron").padding(.trailing, 2)
                        Text(NSLocalizedString("Modify description", comment: "Option in settings"))
                    }
                    
                    Toggle(isOn: $privateProfile) {
                        HStack {
                            Text(Image(systemName: "lock.shield")).padding(.trailing, 4)
                            Text(NSLocalizedString("Private profile", comment: "Option in settings"))
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
                    
                    Button {
                        
                    } label: {
                        HStack {
                            Image(systemName: "sdcard").padding(.horizontal, 3)
                            Text(NSLocalizedString("Clear cache", comment: "Option in settings"))
                            Spacer()
                            Text("\(NSLocalizedString("this will free ", comment: "Tooltip in settings for cache clear button")) ~\(cacheMemoryAmount) MB").font(.footnote).padding(.top, 3)
                        }.foregroundColor(.gray)
                    }
                    
                }
                
                // Account settings start here
                Section(NSLocalizedString("Account", comment: "Section in settings")) {
                    NavigationLink {
                        SecuritySettings()
                    } label: {
                        Image(systemName: "key").padding(.horizontal, 4)
                        Text(NSLocalizedString("Login and security", comment: "Option in settings"))
                    }
                    
                    NavigationLink {
                        Text("Not yet implemented.")
                    } label: {
                        Image(systemName: "minus.diamond").padding(.trailing, 2)
                        Text(NSLocalizedString("Delete account", comment: "Option in settings"))
                    }.foregroundColor(.red)
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
