//
//  MapView.swift
//  Swiftgram
//
//  Created by Eliah Lohr on 11.11.22.
//

import MapKit
import SwiftUI

struct MapView: View {
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 37.334_900,
                                       longitude: -122.009_020),
        latitudinalMeters: 750,
        longitudinalMeters: 750
    )

    var body: some View {
        Map(coordinateRegion: $region, showsUserLocation: true)
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
