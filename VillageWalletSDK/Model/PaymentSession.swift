import UIKit

public protocol PaymentSession {
	var paymentSessionId: String { get }

	var merchantId: String { get }

	var walletId: String? { get }

	var expiryTime: Date { get }

	var location: String { get }

	var merchantInfo: DynamicPayload { get }

	var customerInfo: DynamicPayload? { get }
}
