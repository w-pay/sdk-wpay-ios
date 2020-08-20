import UIKit

public protocol PaymentSession {
	func paymentSessionId() -> String

	func merchantId() -> String

	func walletId() -> String?

	func expiryTime() -> Date

	func location() -> String

	func merchantInfo() -> DynamicPayload

	func customerInfo() -> DynamicPayload?
}
