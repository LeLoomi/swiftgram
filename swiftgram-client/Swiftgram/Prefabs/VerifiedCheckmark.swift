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
    
    init(isVerified:Bool, size:CGFloat) {
        self.isVerified = isVerified
        self.size = size
    }
    
    var body: some View {
        if(isVerified) {
            Image(systemName: "checkmark.seal")
                .font(.system(size: size, weight: .semibold))
                .foregroundColor(Color("ContainerText"))
        }
    }
}

struct VerifiedCheckmark_Previews: PreviewProvider {
    static var previews: some View {
        VerifiedCheckmark(isVerified: true, size: 20)
    }
}
