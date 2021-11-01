//
//  CelestialObjectRow.swift
//  MySpaceApp
//
//  Created by Noman Ahmad on 10/26/21.
//

import SwiftUI
import Kingfisher

struct CelestialObjectRow: View {
    
    var celestial_object: CelestialObject
    
    var body: some View {
       HStack {
        KFImage(URL(string: celestial_object.image_url)!).resizable().aspectRatio(contentMode: .fit).frame(width: 70, height: 70).clipShape(RoundedRectangle(cornerSize: CGSize(width: 10, height: 10)))
            Text(celestial_object.name)
            Spacer()
       }.aspectRatio(contentMode: .fill)
    }
}

struct CelestialObjectRow_Previews: PreviewProvider {
    static var previews: some View {
        CelestialObjectRow(celestial_object: (localData!.universe[1].star_system[0]))
    }
}
