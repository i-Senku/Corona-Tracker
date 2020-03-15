
struct TimeLine : Codable{
    let date : String
    let time : [Time]
}


struct Time : Codable{
    let time : String?
    let description : String?
    let source : String?
}
