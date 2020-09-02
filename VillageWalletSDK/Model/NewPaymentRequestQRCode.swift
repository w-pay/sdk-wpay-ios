import UIKit

public protocol NewPaymentRequestQRCode {
	var referenceId: String { get }

	var referenceType: QRCodePaymentReferenceType { get }

	// should default to 0
	var timeToLive: Int { get }
}
