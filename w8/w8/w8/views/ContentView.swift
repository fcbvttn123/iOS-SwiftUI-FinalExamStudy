import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack{
            VStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                Text("Conference Planner")
                NavigationLink(destination: ProgramView()){
                    Text("Program")
                }
            }
            .padding()
        }
    }
}
