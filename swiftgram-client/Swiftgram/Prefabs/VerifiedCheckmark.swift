//
//  VerifiedCheckmark.swift
//  Swiftgram
//
//  Created by Eliah Lohr on 28.10.22.
//

import SwiftUI

struct VerifiedCheckmark: View {
    var isVerified: Bool = false
    var size: CGFloat = 15

    @State var showTooltip = false
    @AppStorage("AppTheme") private var appTheme = "BaseTheme"

    init(isVerified: Bool, size: CGFloat) {
        self.isVerified = isVerified
        self.size = size
    }

    var body: some View {
        if isVerified {
            Button(action: {
                showTooltip = true
            }, label: {
                Image(systemName: "checkmark.seal")
                    .font(.system(size: size, weight: .semibold))
                    .foregroundColor(Color(appTheme + "/ContainerText"))
            })
            .alert(isPresented: $showTooltip) {
                Alert(
                    title: Text(NSLocalizedString("This user is verified.", comment: "")),
                    message: Text(NSLocalizedString("Their identity has been verified by Swiftgram.", comment: ""))
                )
            }
        }
    }
}

struct VerifiedCheckmark_Previews: PreviewProvider {
    static var previews: some View {
        VerifiedCheckmark(isVerified: true, size: 20)
    }
}
