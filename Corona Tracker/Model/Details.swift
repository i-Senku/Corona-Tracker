
import Foundation

struct CountryDetails: Codable {
    let country: String
    let cases, todayCases, deaths, todayDeaths: Int
    let recovered, critical: Int
}
