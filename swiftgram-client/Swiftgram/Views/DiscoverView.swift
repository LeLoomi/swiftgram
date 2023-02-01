//
//  DiscoverView.swift
//  Swiftgram
//
//  Created by Eliah Lohr on 25.09.22.
//

import SwiftUI

struct DiscoverView: View {
    @AppStorage("AppTheme") private var appTheme = "BaseTheme"
    
    @State var searchText: String = ""
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "magnifyingglass").foregroundColor(Color(appTheme + "/ContainerText")).padding(.leading, 5)
                TextField(NSLocalizedString("Look someone up...", comment: "Tooltip in discover search bar."), text: $searchText)
                    .padding(.trailing, 25)
            }
            .padding(.top, 15)
            .padding(.leading, 15)
            .padding(.bottom, 5)
            
            Divider().padding(.horizontal, 15)
            
            let columns = [
                GridItem(.adaptive(minimum: 100), spacing: 0),
            ]
            
            if(searchText == "") {
                ScrollView {
                    LazyVGrid(columns: columns, alignment: .center, spacing: 15) {
                        ImageTile(contentUrl: "https://i.ibb.co/thp8tmS/temple.jpg")
                        ImageTile(contentUrl: "https://i.ibb.co/3rmGmdC/skyline.png")
                        ImageTile(contentUrl: "https://i.ibb.co/RHZBNG8/bikes.png")
                        ImageTile(contentUrl: "https://i.ibb.co/bKX0knS/leafes.png")
                        ImageTile(contentUrl: "https://i.ibb.co/pRv8Nm6/river.png")
                    }.padding(10)
                }
            } else {
                VStack {
                    SearchResult(ownerName: "LeLoomi", isVerified: true, ownerAvatarUrl: "https://cutt.ly/l2We909")
                    SearchResult(ownerName: "LeLoomi", isVerified: true, ownerAvatarUrl: "https://cutt.ly/l2We909")
                    SearchResult(ownerName: "LeLoomi", isVerified: true, ownerAvatarUrl: "https://cutt.ly/l2We909")
                }
                Spacer()
            }
        }
        .foregroundColor(Color(appTheme + "/ContainerText"))
        .frame(width: 370, alignment: .top)
        .background(alignment: .top) {
            Rectangle() // as long as paddings (.trailing/.vertical) are set correctly, the background will auto scale
                .foregroundColor(Color(appTheme + "/ContainerBackground"))
                .cornerRadius(15)
        }
    }
}

struct DiscoverView_Previews: PreviewProvider {
    static var previews: some View {
        DiscoverView()
    }
}
