

import Foundation

class UserViewModel: ObservableObject {
    @Published var userData = [
        User(name: "person1", adalt: true),
        User(name: "person2", adalt: false)
    ]
    
    func delete(offset: IndexSet) {
        self.userData.remove(atOffsets: offset)
    }
    
    func addUser(name: String, adalt: Bool) {
        self.userData.append(User(name: name, adalt: adalt))
    }
    
    //ローカルに保存するファンクション
}
