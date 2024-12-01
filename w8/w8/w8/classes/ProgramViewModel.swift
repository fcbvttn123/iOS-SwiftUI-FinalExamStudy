import SwiftUI

final class ProgramViewModel: ObservableObject {
    
    private(set) var connectivityProvider: ConnectionProvider
    
    init(connectivityProvider: ConnectionProvider) {
        self.connectivityProvider = connectivityProvider
        self.connectivityProvider.connect()
    }

}
