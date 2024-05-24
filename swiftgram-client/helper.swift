//
//  helper.swift
//  Swiftgram
//
//  Created by Eliah Lohr on 04.11.22.
//

import SwiftUI

struct helper: View {
    var body: some View {
        let butler = Butler()
        Text(butler.wip(number: 1600))
    }
}

struct helper_Previews: PreviewProvider {
    static var previews: some View {
        helper()
    }
}
