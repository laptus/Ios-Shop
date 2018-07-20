import Foundation

/// struct for auth and changing user data requests
struct UserInfo: Codable {
    
    var id: Int
    var name: String
    var password: String
    var eMail: String
    var bio: String
    var creditcard: String
    var gender: String
    
    enum CodigKeys: String, CodingKey {
        case id = "id_user"
        case name = "username"
        case password = "password"
        case eMail = "email"
        case bio = "bio"
        case creditcard = "credit_card"
        case gender = "gender"
    }
}
