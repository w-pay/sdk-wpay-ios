import UIKit

/**
	Adds the Merchant ID to the request
 */
class MerchantIdRequestHeader: RequestHeaderFactory {
	private let merchantId: String

	init(merchantId: String) {
		self.merchantId = merchantId
	}

	/**
		- See: `RequestHeaderFactory.addHeaders(...)`
   */
	public func addHeaders(headers: inout [String: String]) -> Void {
		headers[X_MERCHANT_ID] = self.merchantId
	}
}
