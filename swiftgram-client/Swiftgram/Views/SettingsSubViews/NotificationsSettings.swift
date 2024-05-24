//
//  NotificationsSettings.swift
//  Swiftgram
//
//  Created by Eliah Lohr on 22.12.22.
//

import SwiftUI

struct NotificationsSettings: View {
    @AppStorage("enableNotifications") private var enableNotifcations: Bool = true
    @AppStorage("notifyNewFollower") private var notifyNewFollower: Bool = true
    @AppStorage("notifyNewLike") private var notifyNewLike: Bool = true
    @AppStorage("notifyNewComment") private var notifyNewComment: Bool = true
    
    @AppStorage("notifyNewDevice") private var notifyNewDevice: Bool = true
    
    var body: some View {
        Form {
            Section {
                Toggle(NSLocalizedString("Enable notifications", comment: "Notification setting"), isOn: $enableNotifcations)
                    .onChange(of: $enableNotifcations.wrappedValue, perform: { _ in
                        enableNotifcations.saveInUserDefaults(key: "enableNotifications")
                    })
            }
            
            Section {
                Toggle(NSLocalizedString("New follower", comment: "Notification setting"), isOn: $notifyNewFollower)
                    .onChange(of: $notifyNewFollower.wrappedValue, perform: { _ in
                        notifyNewFollower.saveInUserDefaults(key: "notifyNewFollower")
                    })
                
                Toggle(NSLocalizedString("New like", comment: "Notification setting"), isOn: $notifyNewLike)
                    .onChange(of: $notifyNewLike.wrappedValue, perform: { _ in
                        notifyNewLike.saveInUserDefaults(key: "notifyNewLike")
                    })
                
                Toggle(NSLocalizedString("New comment", comment: "Notification setting"), isOn: $notifyNewComment)
                    .onChange(of: $notifyNewFollower.wrappedValue, perform: { _ in
                        notifyNewComment.saveInUserDefaults(key: "notifyNewComment")
                    })
            } header: {
                Text(NSLocalizedString("App", comment: "Section in notification setttings"))
            }.disabled(!enableNotifcations)
            
            Section {
                Toggle(NSLocalizedString("New device login", comment: "Notification setting"), isOn: $notifyNewDevice)
                    .onChange(of: $notifyNewDevice.wrappedValue, perform: { _ in
                        notifyNewDevice.saveInUserDefaults(key: "notifyNewDevice")
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
