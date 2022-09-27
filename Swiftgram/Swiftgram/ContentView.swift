//
//  ContentView.swift
//  Swiftgram
//
//  Created by Eliah Lohr on 25.09.22.
//

import SwiftUI

struct ContentView: View {
    
    @State var navIndex = 0
    let tabIcons = ["person.crop.rectangle.stack", "magnifyingglass", "plus.circle", "heart", "person"]
    
    var body: some View {
        //The VStack contains our content and puts the bar at the bottom (change later to allow bar as overlay in feed?)
        VStack {
            
            //placeholder content
            ZStack {
                switch navIndex {
                case 0:
                    FeedView().clipped()
                case 1:
                    DiscoverView()
                case 2:
                    NavigationView {
                        Text("upload page")
                    }
                case 3:
                    InteractionsView()
                case 4:
                    OwnProfileView()
                default:
                    NavigationView {
                        Text("ERROR: unexpected navbar index!")
                    }
                }
            }
            
            
            //This HStack is our actual Navbar
            HStack {
                ForEach(0..<5) { index in
                    Button(action: {
                        navIndex = index
                    }, label: {
                        Spacer()
                        
                        if (index == 2) {
                            Image(systemName: tabIcons[index])
                                .font(.system(size: 40, weight: .bold))
                                .foregroundColor(.orange)
                        }
                        else {
                            Image(systemName: tabIcons[index])
                                .font(.system(size: 28))
                                .foregroundColor(navIndex == index ?
                                                 Color("ContainerText") : Color.gray)
                        }
                        Spacer()
                    })
                }
                
            }.padding(.horizontal, 15)
            
        }.background(Color("AppBackground")).foregroundColor(Color("ContainerText"))
            .preferredColorScheme(.dark)
        
    }
    
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
