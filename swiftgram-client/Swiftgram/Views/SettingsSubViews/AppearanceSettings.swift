//
//  AppearanceSettings.swift
//  Swiftgram
//
//  Created by Eliah Lohr on 21.11.22.
//

import SwiftUI

struct AppearanceSettings: View {
    let themes = ["BaseTheme", "BlueNightTheme", "GreyTheme", "VioletTheme"]

    @AppStorage("AppTheme") private var appTheme: String = "BaseTheme"
    @AppStorage("AppThemeIndex") private var appThemeIndex = 0

    @State var colorModeIndex = 0
    
    var body: some View {
        NavigationView {
            Form {
                // App color mode
                Section(NSLocalizedString("App color mode", comment: "Header in settings")) {
                    Picker("", selection: $colorModeIndex) {
                        Text(NSLocalizedString("System", comment: "Option in settings to set color mode.")).tag(0)
                        Text(NSLocalizedString("Light", comment: "Option in settings to set color mode.")).tag(1)
                        Text(NSLocalizedString("Dark", comment: "Option in settings to set color mode.")).tag(2)
                    }.pickerStyle(.segmented)
                        .padding(5)
                }

                // App theme
                Section(NSLocalizedString("App Theme", comment: "Header in settings.")) {
                    Picker(NSLocalizedString("App Theme", comment: "Header in settings."), selection: $appThemeIndex) {
                        Text(NSLocalizedString("Standard", comment: "Theme name in settings")).tag(0)
                        Text(NSLocalizedString("Blue", comment: "Theme name in settings")).tag(1)
                        Text(NSLocalizedString("Grey", comment: "Theme name in settings")).tag(2)
                        Text(NSLocalizedString("Violet", comment: "Theme name in settings")).tag(3)
                    }.pickerStyle(.inline)
                        .labelsHidden()
                        // Saving the theme when a new one is selected
                        .onChange(of: $appThemeIndex.wrappedValue, perform: { _ in
                            themes[appThemeIndex].saveInUserDefaults(key: "AppTheme")
                            appThemeIndex.saveInUserDefaults(key: "AppThemeIndex")
                        })
                }
            }
        }
    }
}

struct AppearanceSettings_Previews: PreviewProvider {
    static var previews: some View {
        AppearanceSettings()
    }
}
