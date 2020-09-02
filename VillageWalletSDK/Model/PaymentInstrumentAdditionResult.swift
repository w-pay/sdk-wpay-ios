import UIKit

public protocol PaymentInstrumentAdditionResult {
	var cardCaptureURL: String { get }

	var transactionRef: String? { get }
}
