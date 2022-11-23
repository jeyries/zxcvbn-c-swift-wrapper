import Foundation
import ZxcvbnC

public final class ZxcvbnCWrapper {
    
    public static let shared = ZxcvbnCWrapper()
    
    public struct Result {
        public let entropy: Double
    }
    
    private init() {
        let dataURL = Bundle.module.url(forResource: "zxcvbn", withExtension: "dat")!
        let filename = dataURL.path
        let success = ZxcvbnInit(filename)
        precondition(success != 0)
    }
    
    deinit {
        ZxcvbnUnInit()
    }
    
    public func evaluate(password: String) -> Result {

        /*
        var info: UnsafeMutablePointer<ZxcMatch_t>? = nil
        let result = withUnsafeMutablePointer(to: &info) { ptr in
            return ZxcvbnMatch(password, nil, ptr)
        }
        debugPrint("info", info?.pointee)
        ZxcvbnFreeInfo(info)
        */
        
        let entropy = ZxcvbnMatch(password, nil, nil)
        
        return Result(entropy: entropy)
    }
}

