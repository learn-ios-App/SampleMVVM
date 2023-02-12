
import SwiftUI

struct AddView: View {
    @State private var name = ""
    @State private var age = ""
    let save: (String, Bool) -> Void
    let checkAdalt: (String) -> Bool
    var body: some View {
        VStack {
            TextField("名前", text: $name)
            TextField("年齢", text: $age)
            Button(action: {
                save(name, checkAdalt(age))
            }) {
                Text("save")
            }
        }
        .textFieldStyle(RoundedBorderTextFieldStyle())
        .frame(width: 150)
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(save: { _, _ in }, checkAdalt: { _ in return true})
    }
}
