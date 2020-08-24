import UIKit

public protocol CreatePaymentSessionRequest {
	func location() -> String

	func merchantInfo() -> DynamicPayload

	// return false by default
	func generateQR() -> Bool

	// return 0 by default
	func timeToLivePaymentSession() -> Int

	// return 0 by default
	func timeToLiveQR() -> Int
}
