import UIKit

public protocol CreatePaymentSessionResult {
	var paymentSessionId: String { get }

	var qr: QRCode? { get }
}
