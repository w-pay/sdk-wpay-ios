import UIKit

public protocol QRCode {
	var qrId: String { get }

	var referenceId: String { get }

	var referenceType: QRCodePaymentReferenceType? { get }

	var content: String { get }

	var image: String { get }

	var expiryTime: Date? { get }
}
