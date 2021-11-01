//
//  StarSystemList.swift
//  MySpaceApp
//
//  Created by Noman Ahmad on 10/31/21.
//

import SwiftUI

struct StarSystemList: View {
    
    @State private var searchText = ""
    var universe : Universe
    
    var body: some View {
        NavigationView {
            List {
                ForEach(searchResults, id: \.name) {
                    star_system in
                    NavigationLink(destination: CelestialObjectList(current_star_system: star_system)) {
                        StarSystemRow(star_system: star_system)
                    }
                }
            }
            .searchable(text: $searchText)
            .navigationBarTitleDisplayMode(.automatic)
            .navigationBarTitle("Star Systems")
        }
    }
    
    
    
    
    var searchResults : [StarSystem] {
        if searchText.isEmpty {
            return localData!.universe
        } else {
            let results = localData!.universe.filter {$0.name.contains(searchText)}
            return results
        }
    }
}

struct StarSystemList_Previews: PreviewProvider {
    static var previews: some View {
        StarSystemList(universe: localData!)
    }
}
