//
//  CelestialObjectDetail.swift
//  MySpaceApp
//
//  Created by Noman Ahmad on 10/26/21.
//

import SwiftUI
import Kingfisher

func getDescription(fileName file: String) -> String {
    if let path = Bundle.main.path(forResource: file, ofType: ".txt") {
        do {
            let text = try String(contentsOfFile: path, encoding: String.Encoding.utf8)
            return text
        } catch {
            debugPrint("Failed to read text from \(file)")
            return ""
        }
    } else {
        debugPrint("Failed to load file from app bundle \(file)")
        return ""
    }
}


struct CelestialObjectDetail: View {
    var current_celestial_object : CelestialObject
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack{
                
                KFImage(URL(string: current_celestial_object.image_url)!).resizable().aspectRatio(contentMode: .fit).frame(height: 225).clipShape(RoundedRectangle(cornerSize: CGSize(width: 10, height: 10)))
                Text(current_celestial_object.name)
                    .fontWeight(.bold)
                    .font(.title)
                Spacer()
                VStack(alignment: .leading, spacing: 10) {

                    HStack(alignment: .top) {
                        Text("Type:").fontWeight(.bold).font(.subheadline)
                        Text("\(current_celestial_object.type)").font(.subheadline)
                        Spacer()
                    }
                    HStack(alignment: .top) {
                        Text("Discovered:").fontWeight(.bold).font(.subheadline)
                        Text("\(current_celestial_object.discovered)").font(.subheadline)
                        Spacer()
                    }
                    HStack(alignment: .top) {
                        Text("Discovered By:").fontWeight(.bold).font(.subheadline).allowsTightening(true).lineLimit(1).minimumScaleFactor(0.5)
    //                    Text("[\(current_celestial_object.discovered_by)](https://example.com)").font(.subheadline)
                        Link("\(current_celestial_object.discovered_by)", destination: URL(string: current_celestial_object.discovered_by_link)!).font(.subheadline)
                        Spacer()
                    }
                    HStack(alignment: .top) {
                        Text("Mass:").fontWeight(.bold).font(.subheadline)
                        Text("\(current_celestial_object.mass, specifier: "%.2f") x 10^\(current_celestial_object.mass_offset) kg").font(.subheadline)
                        Spacer()
                    }
                    HStack(alignment: .top) {
                        Text("Distance from Sun:").fontWeight(.bold).font(.subheadline)
                        Text("\(current_celestial_object.distance_from_sun, specifier: "%.2f") x 10^\(current_celestial_object.distance_from_sun_offset) km").font(.subheadline)
                        Spacer()
                    }
                    HStack(alignment: .top) {
                        Text("Description:").fontWeight(.bold).font(.subheadline)
                    }
                    HStack(alignment: .top) {
                        Text(getDescription(fileName: current_celestial_object.description_name)).font(.subheadline)
                    }
                    HStack {
                        Text("In-Depth Look:").fontWeight(.bold).font(.subheadline)
                        NavigationLink(destination: CelestialObjectMoreDetails(current_celestial_body: current_celestial_object)) {
                            Text("Learn More About \(current_celestial_object.name)")
                        }
                        Spacer()
                    }
                    HStack(alignment: .top) {
                        Text("External Links:").fontWeight(.bold).font(.subheadline)
                        Link("NASA", destination: URL(string: current_celestial_object.nasa_link)!)
                        Link("Wiki", destination: URL(string: current_celestial_object.wiki_link)!)
                        Spacer()
                    }
                    
                    
                    
                }.padding()
                
                
            }
        }
            
        
    }
        
}

struct CelestialObjectDetail_Previews: PreviewProvider {
    static var previews: some View {
        CelestialObjectDetail(current_celestial_object: localData!.solar_system[2])
    }
}
