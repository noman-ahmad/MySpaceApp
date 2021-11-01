//
//  CelestialObjectList.swift
//  MySpaceApp
//
//  Created by Noman Ahmad on 10/26/21.
//

import SwiftUI

struct CelestialObjectList: View {
    
    @State private var searchText = ""
    var current_star_system : StarSystem
    
    var body: some View {
            List(searchResults, id: \.distance_from_sun) {
                objects in
                NavigationLink(destination: CelestialObjectDetail(current_celestial_object: objects)) {
                    CelestialObjectRow(celestial_object: objects)
                }
                .searchable(text: $searchText)
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarTitle(current_star_system.name)
            }

    }
    
    var searchResults : [CelestialObject] {
        if searchText.isEmpty {
            return current_star_system.star_system
        } else {
            let results = current_star_system.star_system.filter {$0.name.contains(searchText) || $0.type.contains(searchText)}
            if results.count != 0 {
                return results
            } else {
                return current_star_system.star_system
            }
        }
    }
}

struct CelestialObjectList_Previews: PreviewProvider {
    static var previews: some View {
        CelestialObjectList(current_star_system: localData!.universe[1])
    }
}
