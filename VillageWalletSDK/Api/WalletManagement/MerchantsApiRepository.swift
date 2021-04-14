import UIKit

public protocol MerchantsApiRepository {
    /**
     Get the current configuration set of the merchant. If this API is called without a valid access token it is IP restricted to allow unauthenticated server side calls.
     */
    func profile(completion: @escaping ApiCompletion<MerchantProfileResponse>)
}
