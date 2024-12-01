import Foundation
import WatchConnectivity

class ConnectionProvider: NSObject, WCSessionDelegate {
   
    let session : WCSession
    var programs : [ProgramObject] = []
    var receivedPrograms : [ProgramObject] = []
    var lastMessage : CFAbsoluteTime = 0
    
    init(session: WCSession = WCSession.default) {
        self.session = session
        super.init()
        self.session.delegate = self
        
        #if os(iOS)
            print("Connection Initialized on iPhone")
        #endif
        
        #if os(watchOS)
            print("Connection initialized on Watch")
        #endif
        
        guard WCSession.isSupported() else {
            print("WCSession not supported")
            return
        }
    
        self.connect()
    }
    
    func connect(){
        guard WCSession.isSupported() else {
            print("WCSession not supported")
            return
        }
        session.activate()
    }
    
    /*
    func send(message: [String:Any]) -> Void {
        session.sendMessage(message, replyHandler: nil){ (error) in
            print(error.localizedDescription)
        }
    }
    */
    
    func initFakeDetails(){
        programs.removeAll()
        
        let progObj = ProgramObject()
        progObj.initWithData(title: "Warp Theory", speaker: "Jim Kirk", from: "Oct 13, 3:15", to: "4:00", details: "Jim will speak about warp theory")
        programs.append(progObj)
        
        let progObj2 = ProgramObject()
        progObj2.initWithData(title: "Astrometrics", speaker: "Spock", from: "Oct 13, 4:15", to: "5:00", details: "Spock will speak about Astrometricks")
        programs.append(progObj2)
        
        let progObj3 = ProgramObject()
        progObj3.initWithData(title: "Fluid Dynamics", speaker: "Scotty", from: "Oct 13, 5:15", to: "6:00", details: "Scotty will speak about fluid dynamics")
        programs.append(progObj3)
        
        let progObj4 = ProgramObject()
        progObj4.initWithData(title: "Universal Translation", speaker: "Uhura", from: "Oct 13, 6:15", to: "7:00", details: "Uhura will speak about Universal Translation")
    }
    
    func sendWatchMessage() {
        NSKeyedArchiver.setClassName("ProgramObject", for: ProgramObject.self)
        let programData = try! NSKeyedArchiver.archivedData(withRootObject: programs, requiringSecureCoding: true)
        
        let currentTime = CFAbsoluteTimeGetCurrent()
        
        if lastMessage + 0.5 > currentTime{
            return
        }
        
        if(WCSession.default.isReachable){
            let message = ["progData" : programData]
            WCSession.default.sendMessage(message, replyHandler: nil)
        }
        lastMessage = CFAbsoluteTimeGetCurrent()
    }
    
    // Triggered after this line: WCSession.default.sendMessage(message, replyHandler: nil)
    func session(_ session: WCSession, didReceiveMessage message: [String : Any]) {
        print("entered didrecievemessage")
        
        if(message["progData"] != nil)
        {
            let loadedData = message["progData"]
            NSKeyedUnarchiver.setClass(ProgramObject.self, forClassName: "ProgramObject")
            let loadedPerson = try! NSKeyedUnarchiver.unarchivedArrayOfObjects(ofClasses: [ProgramObject.self], from: loadedData as! Data) as? [ProgramObject]
            self.receivedPrograms = loadedPerson!
            print("program received")
        }
    }
    
    
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: (any Error)?) {
        
    }
    
    #if os(iOS)
    func sessionDidBecomeInactive(_ session: WCSession) {
        
    }
    
    func sessionDidDeactivate(_ session: WCSession) {
        
    }
    #endif

}
