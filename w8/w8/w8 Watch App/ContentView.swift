import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            NavigationStack{
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                Text("Conference Planner On Watch")
                NavigationLink(destination: ProgContentView()){
                    Text("Program")
                }
            }
            .padding()
        }
    }
}
