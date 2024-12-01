import SwiftUI

struct ProgView : View {
    var prog : ProgramObject
    
    var body: some View{
        VStack{
            Text("\(prog.title!)")
                .font(.headline)
                .foregroundStyle(.blue)
                .frame(width:200, height:30, alignment: .leading)
            Text("\(prog.speaker!)")
                .font(.subheadline)
                .foregroundStyle(.green)
                .frame(width:200, height: 30, alignment: .leading)
            Text("\(prog.from!)")
                .font(.subheadline)
                .foregroundStyle(.red)
                .frame(width:200, height: 30, alignment: .leading)
            Text("\(prog.to!)")
                .font(.subheadline)
                .foregroundStyle(.black)
                .frame(width:200, height: 30, alignment: .leading)
            Text("\(prog.details!)")
                .font(.subheadline)
                .foregroundStyle(.gray)
                .frame(width:200, height: 30, alignment: .leading)
        }
    }
}

struct ProgramView: View {
    @StateObject private var viewModel = ProgramViewModel(connectivityProvider: ConnectionProvider())
    @State private var programs : [ProgramObject] = []

    var body: some View {
        VStack{
            List(programs, id:\.self){ p in
                ProgView(prog: p)
            }
        }.onAppear(){
            viewModel.connectivityProvider.initFakeDetails()
            viewModel.connectivityProvider.sendWatchMessage()
            self.programs = viewModel.connectivityProvider.programs
        }.navigationTitle("Conference Program")
    }
}

