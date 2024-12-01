import Foundation

class ProgramObject: NSObject, ObservableObject, NSSecureCoding {
  
    public static var supportsSecureCoding: Bool = true
    
    let id = UUID()
    @Published var title : String?
    @Published var speaker : String?
    @Published var from : String?
    @Published var to : String?
    @Published var details : String?
    
    func initWithData( title : String, speaker : String, from : String, to : String, details: String)
    {
        self.title = title
        self.speaker = speaker
        self.from = from
        self.to = to
        self.details = details
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(self.title, forKey: "title")
        coder.encode(self.speaker, forKey: "speaker")
        coder.encode(self.from, forKey: "from")
        coder.encode(self.to, forKey: "to")
        coder.encode(self.details, forKey: "details")
    }
    
    public required convenience init?(coder decoder: NSCoder) {
        
        guard let title = decoder.decodeObject(forKey: "title") as? String,
              let speaker = decoder.decodeObject(forKey: "speaker") as? String,
              let from = decoder.decodeObject(forKey: "from") as? String,
              let to = decoder.decodeObject(forKey: "to") as? String,
              let details = decoder.decodeObject(forKey:"details") as? String
        else{ return nil }
        
        self.init()
        self.initWithData(title: title as String, speaker: speaker as String, from: from as String, to: to as String, details: details as String)
        
    }
    
}
