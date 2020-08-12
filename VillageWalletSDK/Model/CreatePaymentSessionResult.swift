import UIKit

public protocol CreatePaymentSessionResult {
	func paymentSessionId() -> String

	func qr() -> QRCode?
}
