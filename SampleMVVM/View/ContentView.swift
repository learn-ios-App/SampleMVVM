
import SwiftUI

//Viewのみ
struct ContentView: View {
    @StateObject private var user = UserViewModel()
    @State private var isActive = false
    var body: some View {
        NavigationStack {
            List {
                ForEach(user.userData) { user in
                    HStack {
                        Text(user.name)
                        Text(
                            user.isAdalt
                            ? "大人"
                            : "子供"
                        )
                    }
                }
                .onDelete(perform: user.delete)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        isActive = true
                    }) {
                        Image(systemName: "plus")
                    }
                }
            }
        }
        .sheet(isPresented: $isActive) {
            AddView(
                save: { name, adalt in
                    user.addUser(name: name, adalt: adalt)
                    isActive = false
                },
                checkAdalt: { textAge in
                    let age = Int(textAge) ?? 0
                    if age >= 20 {
                        return true
                    } else {
                        return false
                    }
                }
            )
        }
        .onAppear() {
            user.firstGet()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
