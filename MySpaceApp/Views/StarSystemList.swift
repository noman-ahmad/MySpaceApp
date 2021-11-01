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
            List(searchResults, id: \.name) {
                objects in
                NavigationLink(destination: CelestialObjectList(current_star_system: objects)) {
                    StarSystemRow(star_system: objects)
                }
                .searchable(text: $searchText)
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarTitle("Star Systems")
            }
            
        }
    }
    
    
    
    
    var searchResults : [StarSystem] {
        if searchText.isEmpty {
            return localData!.universe
        } else {
            let results = localData!.universe.filter {$0.name.contains(searchText)}
            if results.count != 0 {
                return results
            } else {
                return localData!.universe
            }
        }
    }
}

struct StarSystemList_Previews: PreviewProvider {
    static var previews: some View {
        StarSystemList(universe: localData!)
    }
}
