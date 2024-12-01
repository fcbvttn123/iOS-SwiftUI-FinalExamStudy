import WidgetKit

struct ProgramData : TimelineProvider{
    
    let placeholderEntry = ProgramObject(topic: "", speaker: "", date: Date(), to: Date(), details: "")
    
    var programs : [ProgramObject] = [
        ProgramObject(topic: "Intro to Flying", speaker: "Jim Kirk", date: Calendar.current.date(byAdding: .minute, value: 1, to: Date())! as Date, to: Calendar.current.date(byAdding: .minute, value: 60, to: Date())! as Date, details: "Jim will teach flying"),

        ProgramObject(topic: "Intro To Fluid Dynamics", speaker: "Mr Spock", date: Calendar.current.date(byAdding: .minute, value: 61, to: Date())! as Date, to: Calendar.current.date(byAdding: .minute, value: 120, to: Date())! as Date, details: "Spock will teach fluid dynamics"),
        
        ProgramObject(topic: "Intro to Engineering", speaker: "Montgomery Scott", date: Calendar.current.date(byAdding: .minute, value: 121, to: Date())! as Date, to: Calendar.current.date(byAdding: .minute, value: 180, to: Date())! as Date, details: "Scotty will teach Engineering"),

        ProgramObject(topic: "Intro to Communication", speaker: "Nyota Uhura", date: Calendar.current.date(byAdding: .minute, value: 181, to: Date())! as Date, to: Calendar.current.date(byAdding: .minute, value: 240, to: Date())! as Date, details: "Uhura will teach communications"),
    ]
    
    func placeholder(in context: Context) -> ProgramObject {
        return placeholderEntry
    }
    
    func getSnapshot(in context: Context, completion: @escaping (ProgramObject) -> ()) {
        completion(placeholderEntry)
    }
    
    func getTimeline(in context: Context, completion: @escaping (Timeline<ProgramObject>) -> Void) {
        let timeline = Timeline(entries: programs, policy: .atEnd)
        completion(timeline)
    }
    
}
