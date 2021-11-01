//
//  SolarSystemDetails.swift
//  MySpaceApp
//
//  Created by Noman Ahmad on 10/26/21.
//

import Foundation

struct Universe: Decodable {
    let universe: [StarSystem]
}


struct StarSystem: Decodable {
    let name : String
    let star_system : [CelestialObject]
    let image: String
}

struct CelestialObject: Decodable {
    let type : String
    let name: String
    let discovered: String
    let discovered_by: String
    let discovered_by_link: String
    let mass : Float
    let mass_offset: Int
    let radius: Float
    let radius_offset: Int
    let density: Float
    let gravity: Float
    let escape_velocity: Float
    let rotation_period: Float
    let length_of_day : Float
    let distance_from_sun : Float
    let distance_from_sun_offset: Int
    let perihelion : Float
    let perihelion_offset: Int
    let aphelion : Float
    let aphelion_offset: Int
    let orbital_period : Float
    let orbital_velocity: Float
    let orbital_velocity_offset: Int
    let orbital_inclination: Float
    let orbital_eccentricity: Float
    let obliquity_to_orbit: Float
    let mean_temperature: Int
    let surface_pressure: Float
    let number_of_moons: Int
    let ring_system: Bool
    let global_magnetic_field: Bool
    let image_url: String
    let description_name: String
    let nasa_link: String
    let wiki_link: String
    let video_link: String
    let planet_facts: String
    let image_1 : String
    let image_2 : String
    let image_3 : String
    let image_4 : String
    let image_5: String
    let image_6 : String
}


private func readLocalFile(forName name: String) -> Data? {
    do {
        if let bundlePath = Bundle.main.path(forResource: name, ofType: "json"),
           let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8) {
            return jsonData
        }
    } catch {
        debugPrint(error)
    }
    return nil
}

private func parseData(jsonData: Data) -> Universe? {
    do {
        let decodedData = try JSONDecoder().decode(Universe.self, from: jsonData)
        print(decodedData)
        return decodedData;
    } catch {
        debugPrint(error)
        return nil;
    }
}

let localData = parseData(jsonData: readLocalFile(forName: "solar_system")!)
