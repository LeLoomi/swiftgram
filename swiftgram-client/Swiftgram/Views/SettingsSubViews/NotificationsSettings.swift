//
//  NotificationsSettings.swift
//  Swiftgram
//
//  Created by Eliah Lohr on 22.12.22.
//

import SwiftUI

struct NotificationsSettings: View {
    let butler = Butler()
    
    @AppStorage("enableNotifications") private var enableNotifcations: Bool = true
    
    @AppStorage("notifyNewFollower") private var newFollower: Bool = true
    @AppStorage("notifyNewLike") private var newLike: Bool = true
    @AppStorage("notifyNewComment") private var newComment: Bool = true
    
    @AppStorage("notifyNewDevice") private var newDevice: Bool = true
    
    var body: some View {
        Form {
            Section {
                Toggle(NSLocalizedString("Enable notifications", comment: "Notification setting"), isOn: $enableNotifcations)
                    .onChange(of: $enableNotifcations.wrappedValue, perform: { _ in
                        butler.saveSetting(key: "enableNotifications", value: enableNotifcations)
                    })
            }
            
            Section {
                Toggle(NSLocalizedString("New follower", comment: "Notification setting"), isOn: $newFollower)
                    .onChange(of: $newFollower.wrappedValue, perform: { _ in
                        butler.saveSetting(key: "notifyNewFollower", value: newFollower)
                    })
                
                Toggle(NSLocalizedString("New like", comment: "Notification setting"), isOn: $newLike)
                    .onChange(of: $newLike.wrappedValue, perform: { _ in
                        butler.saveSetting(key: "notifyNewLike", value: newLike)
                    })
                
                Toggle(NSLocalizedString("New comment", comment: "Notification setting"), isOn: $newComment)
                    .onChange(of: $newFollower.wrappedValue, perform: { _ in
                        butler.saveSetting(key: "notifyNewComment", value: newComment)
                    })
            } header: {
                Text(NSLocalizedString("App", comment: "Section in notification setttings"))
            }.disabled(!enableNotifcations)
            
            Section {
                Toggle(NSLocalizedString("New device login", comment: "Notification setting"), isOn: $newDevice)
                    .onChange(of: $newDevice.wrappedValue, perform: { _ in
                        butler.saveSetting(key: "notifyNewDevice", value: newDevice)
                    })
                
            } header: {
                Text(NSLocalizedString("Account", comment: "Section in notification settings"))
            }.disabled(!enableNotifcations)
        }
    }
}

struct NotificationsSettings_Previews: PreviewProvider {
    static var previews: some View {
        NotificationsSettings()
    }
}
