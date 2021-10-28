//
//  CelestialObjectList.swift
//  MySpaceApp
//
//  Created by Noman Ahmad on 10/26/21.
//

import SwiftUI

struct CelestialObjectList: View {
    var body: some View {
        
        NavigationView {
            List(localData!.solar_system, id: \.distance_from_sun) {
                objects in
                NavigationLink(destination: CelestialObjectDetail(current_celestial_object: objects)) {
                    CelestialObjectRow(celestial_object: objects)
                }
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarTitle("Celestial Objects")
            }

            
        }

    }
}

struct CelestialObjectList_Previews: PreviewProvider {
    static var previews: some View {
        CelestialObjectList()
    }
}
