import Foundation

class Utilities
{
    class func isNetworkAvailable() -> Bool
    {
        return (Reachability.init(hostname:BASE_URL)?.isReachable)!
    }
}
