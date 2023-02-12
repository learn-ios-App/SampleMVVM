

import Foundation

class UserViewModel: ObservableObject {
    @Published var userData = [
        User(name: "person1", adalt: true),
        User(name: "person2", adalt: false)
    ]
     //削除
    func delete(offset: IndexSet) {
        self.userData.remove(atOffsets: offset)
        let json = encodeUser(user: userData)
        setDefaults(json: json)
    }
    //追加
    func addUser(name: String, adalt: Bool) {
        self.userData.append(User(name: name, adalt: adalt))
        let json = encodeUser(user: userData)
        setDefaults(json: json)
    }
    //データ保存
    func setDefaults(json: String) {
        let userDefaults = UserDefaults.standard
        userDefaults.set(json, forKey: "key")
    }
    //データの取得
    func getDefaults() -> String {
        let userDefaults = UserDefaults.standard
        let result = userDefaults.string(forKey: "key") ?? ""
        return result
    }
    //[User] -> String
    func encodeUser(user: [User]) -> String {
        do {
            let data = try JSONEncoder().encode(user)
            let json = String(data: data, encoding: .utf8)!
            return json
        } catch {
            return ""
        }
    }
    //String -> [User]
    func decodeUser(json: String) -> [User] {
        let data = json.data(using: .utf8)!
        do {
            let user = try JSONDecoder().decode([User].self, from: data)
            return user
        } catch {
            return []
        }
    }
}
