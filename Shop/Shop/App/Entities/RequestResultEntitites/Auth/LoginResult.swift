import Foundation

struct LoginResult: Codable {
    let result: Int
    let user: User
     
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.result = try container.decode(Int.self, forKey: .result)
        let contUSer = try container.nestedContainer(keyedBy: User.CodingKeys.self, forKey: .user)
        let id = try contUSer.decode(Int.self, forKey: .id)
        let login = try contUSer.decode(String.self, forKey: .login)
        let name = try contUSer.decode(String.self, forKey: .name)
        let lastname = try contUSer.decode(String.self, forKey: .lastname)
        self.user = User(id: id, login: login, name: name, lastname: lastname)
    }
}
