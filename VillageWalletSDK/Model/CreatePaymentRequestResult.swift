import UIKit

public protocol CreatePaymentRequestResult {
	var paymentRequestId: String { get }

	var qr: QRCode? { get }
}
