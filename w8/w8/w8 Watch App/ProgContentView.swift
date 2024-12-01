import SwiftUI

struct ProgView2 : View {
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

struct ProgContentView: View {
    @StateObject private var viewModel = ProgramViewModel(connectivityProvider: ConnectionProvider())
    @State private var programs : [ProgramObject] = []
    
    var body: some View {
        VStack{
            List(programs, id:\.self){ p in
                ProgView2(prog: p)
            }
        }.onAppear(){
            self.programs = viewModel.connectivityProvider.receivedPrograms
        }.navigationTitle("Conference Program")
    }
}
