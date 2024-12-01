import SwiftUI
import WidgetKit

struct ProgramWidgetView: View {
    
    var entry: ProgramData.Entry
        
    var body: some View {
        #if os(iOS)
        VStack(alignment: .leading){
            HStack{
                Image(systemName: "drop")
                Text("Conference Agenda")
            }
                .font(.title3)
                .bold()
                .padding(.bottom, 8)
            Text(entry.topic)
                .font(.caption)
            Text(entry.speaker)
                .font(.caption2)
            Spacer()
            HStack{
                Spacer()
                Text("From: \(entry.date.formatted(.dateTime))")
                    .font(.caption2)
                Text("To: \(entry.to.formatted(.dateTime))")
                    .font(.caption2)
            }
        }
        #endif
        
        #if os(watchOS)
        VStack(alignment: .leading){
            Text(entry.topic)
                .font(.headline)
            Text(entry.speaker)
                .font(.subheadline)
            HStack{
                Text("From: \(entry.date.formatted(.dateTime))")
                    .font(.subheadline)
                Text("To: \(entry.to.formatted(.dateTime))")
                    .font(.subheadline)
            }
        }
        #endif
    }
    
}
