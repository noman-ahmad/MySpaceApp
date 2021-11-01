//
//  StarSystemRow.swift
//  MySpaceApp
//
//  Created by Noman Ahmad on 10/31/21.
//

import SwiftUI
import Kingfisher

struct StarSystemRow: View {
    
    var star_system: StarSystem
    
    var body: some View {
        HStack {
            KFImage(URL(string: star_system.image)!).resizable().aspectRatio(contentMode: .fit).frame(width: 70, height: 70).clipShape(RoundedRectangle(cornerSize: CGSize(width: 10, height: 10)))
             Text(star_system.name)
             Spacer()
        }.aspectRatio(contentMode: .fill)
    }
}

struct StarSystemRow_Previews: PreviewProvider {
    static var previews: some View {
        StarSystemRow(star_system: localData!.universe[0])
    }
}
