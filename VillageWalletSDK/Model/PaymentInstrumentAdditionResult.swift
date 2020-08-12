import UIKit

public protocol PaymentInstrumentAdditionResult {
	func cardCaptureURL() -> String

	func transactionRef() -> String?
}
