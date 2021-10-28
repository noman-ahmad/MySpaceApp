//
//  CelestialObjectMoreDetails.swift
//  MySpaceApp
//
//  Created by Noman Ahmad on 10/27/21.
//

import SwiftUI
import Kingfisher
import AVKit

struct CelestialObjectMoreDetails: View {
    var current_celestial_body : CelestialObject
    var body: some View {
        ScrollView(.vertical, showsIndicators: true) {
            VStack{
                VStack {
                    HStack(alignment: .top) {
                        Spacer()
                        Text("In-Depth Look at \(current_celestial_body.name)").fontWeight(.bold).font(.headline)
                        Spacer()
                    }
                    HStack{
                        Spacer()
                        VideoPlayer(player: AVPlayer(url: URL(string: current_celestial_body.video_link)!)).frame(width: 400, height: 200)
                        Spacer()
                    }
                }
                VStack(alignment: .leading, spacing: 10) {
                    HStack {
                        Spacer()
                        Text("\(current_celestial_body.name) by the Numbers").fontWeight(.bold).font(.headline)
                        Spacer()
                    }
                    Group {
                        HStack {
                            Text("Mass:").fontWeight(.bold).font(.subheadline)
                            Text("\(current_celestial_body.mass, specifier: "%.2f") x 10^\(current_celestial_body.mass_offset) kg").font(.subheadline)
                            Spacer()
                        }
                        HStack(alignment: .top) {
                            Text("Radius:").fontWeight(.bold).font(.subheadline)
                            Text("\(current_celestial_body.radius, specifier: "%.2f") x 10^\(current_celestial_body.radius_offset) km").font(.subheadline)
                            Spacer()
                        }
                        HStack(alignment: .top) {
                            Text("Gravity:").fontWeight(.bold).font(.subheadline)
                            Text("\(current_celestial_body.gravity, specifier: "%.2f") m/s^2").font(.subheadline)
                            Spacer()
                        }
                        HStack(alignment: .top) {
                            Text("Distance from Sun:").fontWeight(.bold).font(.subheadline)
                            Text("\(current_celestial_body.distance_from_sun, specifier: "%.2f") x 10^\(current_celestial_body.distance_from_sun_offset) km").font(.subheadline)
                            Spacer()
                        }
                        HStack(alignment: .top) {
                            Text("Perihelion:").fontWeight(.bold).font(.subheadline)
                            Text("\(current_celestial_body.perihelion, specifier: "%.2f") x 10^\(current_celestial_body.perihelion_offset) km").font(.subheadline)
                            Spacer()
                        }
                        HStack(alignment: .top) {
                            Text("Aphelion:").fontWeight(.bold).font(.subheadline)
                            Text("\(current_celestial_body.aphelion, specifier: "%.2f") x 10^\(current_celestial_body.aphelion_offset) km").font(.subheadline)
                            Spacer()
                        }
                        HStack(alignment: .top) {
                            Text("Length of Day:").fontWeight(.bold).font(.subheadline)
                            Text("\(current_celestial_body.length_of_day, specifier: "%.1f") hours").font(.subheadline)
                            Spacer()
                        }
                        HStack(alignment: .top) {
                            Text("Orbital Period:").fontWeight(.bold).font(.subheadline)
                            Text("\(current_celestial_body.orbital_period, specifier: "%.0f") days").font(.subheadline)
                            Spacer()
                        }
                        HStack {
                            Text("Temperature:").fontWeight(.bold).font(.subheadline)
                            Text("\(current_celestial_body.mean_temperature) C").font(.subheadline)
                            Spacer()
                        }
                    }.padding(.leading)
                }.padding(.all)
                
                VStack(alignment: .leading, spacing: 10) {
                    HStack {
                        Spacer()
                        Text("Did You Know").fontWeight(.bold).font(.headline)
                        Spacer()
                    }
                    Group {
                        HStack(alignment: .top) {
                            Text("\(getDescription(fileName: current_celestial_body.planet_facts))").font(.subheadline).fixedSize(horizontal: false, vertical: true)
                            Spacer()
                        }
                    }.padding(.all)
                  
                }.padding(.all)
                
                
                VStack {
                    HStack {
                        Spacer()
                        Text("Image Gallery").fontWeight(.bold).font(.headline)
                        Spacer()
                    }
                    ScrollView(.horizontal, showsIndicators: true) {
                        HStack {
                            KFImage(URL(string: current_celestial_body.image_1)!).resizable().aspectRatio(contentMode: .fit).frame(width:150, height: 150)
                            KFImage(URL(string: current_celestial_body.image_2)!).resizable().aspectRatio(contentMode: .fit).frame(width:150, height: 150)
                            KFImage(URL(string: current_celestial_body.image_3)!).resizable().aspectRatio(contentMode: .fit).frame(width:150, height: 150)
                            KFImage(URL(string: current_celestial_body.image_4)!).resizable().aspectRatio(contentMode: .fit).frame(width:150, height: 150)
                            KFImage(URL(string: current_celestial_body.image_5)!).resizable().aspectRatio(contentMode: .fit).frame(width:150, height: 150)
                            KFImage(URL(string: current_celestial_body.image_6)!).resizable().aspectRatio(contentMode: .fit).frame(width:150, height: 150)
                        }.padding(.all)

                    }
                }.padding(.all)
            }.padding(.all)
        }
    }
}

struct CelestialObjectMoreDetails_Previews: PreviewProvider {
    static var previews: some View {
        CelestialObjectMoreDetails(current_celestial_body: localData!.solar_system[2])
    }
}
