import UIKit

public protocol CreatePaymentRequestResult {
	func paymentRequestId() -> String

	func qr() -> QRCode?
}
