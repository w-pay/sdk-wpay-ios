import UIKit

public protocol NewPaymentRequestQRCode {
	func referenceId() -> String

	func referenceType() -> QRCodePaymentReferenceType

	// default is 0
	func timeToLive() -> Int
}
