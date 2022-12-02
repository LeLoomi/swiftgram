//
//  LocationBox.swift
//  Swiftgram
//
//  Created by Eliah Lohr on 28.09.22.
//

import CoreLocation.CLLocationManager
import MapKit
import SwiftUI

struct LocationBox: View {
    var postLocationName: String = "none"
    var postLocation: MKCoordinateRegion? // currently nullable, make typesafe when implementation finished

    @State var showMapPopover = false
    @AppStorage("AppTheme") private var appTheme = "BaseTheme"

    init(postLocationName: String) {
        self.postLocationName = postLocationName
    }

    init(latitude: Double, longitude: Double) {
        postLocationName = "second init"
        postLocation = MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: latitude,
                                           longitude: longitude),
            latitudinalMeters: 750,
            longitudinalMeters: 750
        )
    }

    var body: some View {
        if postLocationName != "none" {
            Button(action: {
                CLLocationManager().requestWhenInUseAuthorization()
                showMapPopover = true
            }, label: {
                HStack(spacing: 5) {
                    Text(postLocationName).font(.system(size: 12, weight: .semibold))
                    Image(systemName: "mappin.circle").font(.system(size: 12, weight: .bold))
                }.padding(5)
                    .background(Rectangle()
                        .foregroundColor(.black.opacity(0.5))
                        .cornerRadius(5)
                    )
                    .foregroundColor(.white)
                    .padding(7)
            })
            .popover(isPresented: $showMapPopover, content: {
                VStack {
                    MapView()
                        .overlay {
                            VStack { HStack {
                                Spacer()
                                Button(action: {
                                    showMapPopover = false
                                }, label: {
                                    Image(systemName: "x.circle.fill")
                                        .foregroundColor(Color(appTheme + "/ContainerText"))
                                        .font(.system(size: 25))
                                        .shadow(radius: 15)
                                }).padding(10)
                            }
                            Spacer()
                            }
                        }
                }
            })
        }
    }
}

struct LocationBox_Previews: PreviewProvider {
    static var previews: some View {
        LocationBox(postLocationName: "Ninh Binh, Vietnam")
    }
}
