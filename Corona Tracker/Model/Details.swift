
import Foundation

struct CountryDetails : Codable {
    let confirmed : Confirmeds
    let recovered : Recovereds
    let deaths : Death
}

struct Confirmeds : Codable{
    let value : Int
    let detail : String
}

struct Recovereds : Codable{
    let value : Int
    let detail : String
}
struct Death : Codable{
    let value : Int
    let detail : String
}
