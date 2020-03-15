import Foundation

struct CoronaTracker : Codable {
    let confirmed : Confirmed
    let deaths : Deaths
    let recovered : Recovered
    let lastUpdate : String
}

struct Confirmed : Codable{
    let value : Int
    let detail : String
}

struct Deaths : Codable{
    let value : Int
    let detail : String
}

struct Recovered : Codable{
    let value : Int
    let detail : String
}


